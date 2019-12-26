require 'rails_helper'

RSpec.describe 'ポスト', type: :system do

	describe 'ポスト一覧' do
		let!(:user) {create(:user)}
		let!(:post_1_by_others) { create(:post) }
		let!(:post_2_by_others) { create(:post) }
		let!(:post_by_user) { create(:post, user: user) }

		# ログインしている場合
		# 	フォロワーと自分の投稿だけが表示されること
		context 'ログインしている場合' do
			before do
				login_as user
				user.follow(post_1_by_others.user)
			end
			it '自分とフォロワーの投稿だけ表示されること' do
				visit posts_path
				expect(page).to have_content post_1_by_others.content
				expect(page).not_to have_content post_2_by_others.content
				expect(page).to have_content post_by_user.content
			end
		end

		context 'ログインしていない場合' do
			it 'すべてのポストが表示されること' do
				visit posts_path
				expect(page).to have_content post_1_by_others.content
				expect(page).to have_content post_2_by_others.content
				expect(page).to have_content post_by_user.content
			end
		end
	end

	describe 'ポスト投稿' do
		# 画像投稿できること
	end

	describe 'ポスト更新' do
		# 自分の投稿に編集ポタンが表示されること
		# 痰飲の投稿には編集ポタンが表示されないこと
		# 投稿が更新できること
	end

	describe 'ポスト削除' do
		# 自分の投稿に削除ボタンが表示されること
		# 他人の投稿に削除ボタンが表示されないこと
		# 投稿がさくじょできること
	end

	describe 'ポスト詳細' do
		# 投稿の詳細画面が閲覧できること
	end

	describe 'いいね' do
		# いいねができること
		# いいねが取り消せること
	end
end