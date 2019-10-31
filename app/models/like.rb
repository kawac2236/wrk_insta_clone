# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  post_id    :bigint
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_likes_on_post_id  (post_id)
#  index_likes_on_user_id  (user_id)
#

class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end
