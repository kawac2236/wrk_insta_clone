# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :text(65535)      not null
#  user_id    :bigint
#  images     :json             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#

class Post < ApplicationRecord
  mount_uploaders :images, PostImageUploader
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user

  validates :content, presence: true, length: { maximum: 1000 }
  validates :images, presence: true

  scope :content_contain, ->(content) { where('content like ?', "%#{content}%") }
end
