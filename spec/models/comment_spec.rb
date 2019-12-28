require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'バリデーション' do
    it '本文は必須であること' do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include('を入力してください')
    end

    it '本文は最大1000文字であること' do
      comment = build(:comment, content: 'a' * 1001)
      comment.valid?
      expect(comment.errors[:content]).to include('は1000文字以内で入力してください')
    end
  end
end
