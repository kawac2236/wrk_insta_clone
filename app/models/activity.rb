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

end
