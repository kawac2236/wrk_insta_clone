require 'rails_helper'

RSpec.describe 'ログイン・ログアウト', type: :system do
  let(:user) { create(:user) }
	let(:post) { create(:post, user: user) }

	describe 'ログイン' do
		context '認証情報が正しい場合' do
			it 'ログインできること' do
				visit login_path
				fill_in 'メールアドレス', with: user.email
        fill_in 'パスワード', with: '12345678'
				click_button 'ログイン'
				expect(current_path).to eq root_path
        expect(page).to have_content 'ログインしました'
			end
		end

		context '認証情報が誤りがある場合' do
			it 'ログインできないこと' do
				visit login_path
				fill_in 'メールアドレス', with: user.email
				fill_in 'パスワード', with: '1234'
				click_button 'ログイン'
				expect(current_path).to eq login_path
        expect(page).to have_content 'ログインに失敗しました'
			end
		end
	end

	describe 'ログアウト' do
		before do
			login
		end
		it 'ログアウトできること' do
			click_on('ログアウト')
			expect(current_path).to eq root_path
			expect(page).to have_content 'ログアウトしました'			
		end
	end
end