# == Schema Information
#
# Table name: posts
#
#  id         :bigint           not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  images     :json
#

class Post < ApplicationRecord
  mount_uploaders :images, PostImageUploader
  belongs_to :user

  validates :content, presence: true, length: { maximum: 1000 }
  validates :images, presence: true
end
