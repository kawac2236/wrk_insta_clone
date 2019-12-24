require 'rails_helper'

RSpec.describe User, type: :model do
  describe "バリデーション" do
    it 'ユーザー名は必須であること' do
      user = build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include('を入力してください')
    end

    it 'ユーザー名は一意であること' do
      user = create(:user)
      same_name_user = build(:user, name: user.name)
      same_name_user.valid?
      expect(same_name_user.errors[:name]).to include('はすでに存在します')
    end

    it 'メールアドレスは必須であること' do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include('を入力してください')
    end

    it 'メールアドレスは一意であること' do
      user = create(:user)
      same_email_user = build(:user, email: user.email)
      same_email_user.valid?
      expect(same_email_user.errors[:email]).to include('はすでに存在します')
    end
  end

  describe "インスタンスメソッド" do
    let(:user_a) { create(:user) }
    let(:user_b) { create(:user) }
    let(:user_c) { create(:user) }
    let(:post_by_user_a) { create(:post, user: user_a)}
    let(:post_by_user_b) { create(:post, user: user_b)}
    let(:post_by_user_c) { create(:post, user: user_c)}
    describe 'own?' do
      it '自分のオブジェクトの場合trueを返す' do
        expect(user_a.own?(post_by_user_a)).to be true
      end

      it '自分のオブジェクト以外の場合falseを返す' do
        expect(user_a.own?(post_by_user_b)).to be false
      end
    end

    describe 'myself?' do
      it '自分自身であればtrueを返す' do
        expect(user_a.myself?(user_a)).to be true
      end

      it '自分自身でなければfalseを返す' do
        expect(user_a.myself?(user_b)).to be false
      end
    end

    describe "like" do
      it 'いいねできること' do
        expect { user_a.like(post_by_user_b) }.to change {Like.count}.by(1)
      end

      it 'いいねを解除できること' do
        user_a.like(post_by_user_b)
        expect { user_a.unlike(post_by_user_b) }.to change {Like.count}.by(-1)
      end
    end

    describe "follow" do
      it 'フォローできること' do
        expect { user_a.follow(user_b)}.to change {Relationship.count}.by(1)
      end

      it 'フォロー解除できること' do
        user_a.follow(user_b)
        expect { user_a.unfollow(user_b)}.to change {Relationship.count}.by(-1)
      end

      it 'フォローしている場合trueを返す' do
        user_a.follow(user_b)
        expect(user_a.follow?(user_b)).to be true
      end

      it 'フォローしていない場合falseを返す' do
        expect(user_a.follow?(user_c)).to be false
      end
    end

    describe 'feed' do
      before do
        user_a.follow(user_b)
      end
      subject { user_a.feed }
      it { is_expected.to include post_by_user_a }
      it { is_expected.to include post_by_user_b }
      it { is_expected.not_to include post_by_user_c }
    end
  end
end
