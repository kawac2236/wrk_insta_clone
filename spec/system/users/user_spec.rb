require 'rails_helper'

Rspec.describe 'ユーザー登録', type: :system do
  describe 'ユーザー登録' do
    context '入力情報が正しい場合' do
      it 'ユーザー登録ができること' do
        visit new_user_path
        fill_in 'ユーザー名', with: 'Rails太郎'
        fill_in 'メールアドレス', with: 'rails@example.com'
        fill_in 'パスワード', with: '12345678'
        fill_in 'パスワード確認', with: '12345678'
        click_button '登録'
        expect(current_path).to eq login_path
        expect(page).to have_content 'ユーザーを作成しました'
      end
    end
	end
end