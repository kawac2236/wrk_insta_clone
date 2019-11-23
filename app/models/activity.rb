# == Schema Information
#
# Table name: activities
#
#  id           :bigint           not null, primary key
#  subject_type :string(255)
#  subject_id   :bigint
#  user_id      :bigint
#  action_type  :integer          not null
#  read         :boolean          default(FALSE), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_activities_on_subject_type_and_subject_id  (subject_type,subject_id)
#  index_activities_on_user_id                      (user_id)
#

class Activity < ApplicationRecord
  include Rails.application.routes.url_helpers
  belongs_to :subject, polymorphic: true
  belongs_to :user

  # アクション区分
  enum action_type: {
    commented_to_own_post:  0, # コメント
    liked_to_own_post:      1, # いいね
    followed_me:            2  # フォロー
  }
  # 既読区分
  enum read: {
    unread: false,  # 未読
    read:   true    # 既読
  }

  scope :recent, -> (count) { all.limit(count).order(:created_at) }

  # リダイレクト先
  def redirect_path
    case action_type.to_sym
    when :commented_to_own_post
      post_path(subject.post)
    when :liked_to_own_post
      post_path(subject.post)
    when :followed_me
      user_path(subject.follower)
    end
  end
end
