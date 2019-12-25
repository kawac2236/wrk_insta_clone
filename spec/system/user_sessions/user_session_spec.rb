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
	end
end