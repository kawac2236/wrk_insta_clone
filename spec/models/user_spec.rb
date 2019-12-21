require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it 'ユーザー名は必須であること' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end


#     it 'メールアドレスは必須であること' do
#     it 'メールアドレスは一意であること' do
  end
#     it '自分のオブジェクトの場合trueを返す' do
#     it '自分のオブジェクトの場合falseを返す' do
#     it 'いいねできること' do
#     it 'いいねを解除できること' do
#     it 'フォローできること' do
#     it 'フォローを外せること' do
#     it 'フォローしている場合trueを返す' do
#     it 'フォローしている場合falseを返す' do
#     it { is_expected.to include post_by_user_a }
#     it { is_expected.to include post_by_user_b }
#     it { is_expected.not_to include post_by_user_c }
end
