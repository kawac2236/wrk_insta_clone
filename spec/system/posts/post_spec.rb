require 'rails_helper'

RSpec.describe 'ポスト', type: :system do

	describe 'ポスト一覧' do
		let!(:user) {create(:user)}
		let!(:post_1_by_others) { create(:post) }
		let!(:post_2_by_others) { create(:post) }
		let!(:post_by_user) { create(:post, user: user) }
		context 'ログインしていない場合' do
			it 'すべてのポストが表示されること' do
				visit posts_path
				expect(page).to have_content post_1_by_others.content
				expect(page).to have_content post_2_by_others.content
				expect(page).to have_content post_by_user.content
			end
		end
	end
end