require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "バリデーション" do
    it '画像は必須であること' do
      post = build(:post, images: nil)
      post.valid?
      expect(post.errors[:images]).to include('を入力してください')
    end

    it '本文は必須であること' do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include('を入力してください')
    end

    it '本文は最大1000文字であること' do
      post = build(:post, content: 'a' * 1001)
      post.valid?
      expect(post.errors[:content]).to include('は1000文字以内で入力してください')
    end

  end
end
