class Post < ApplicationRecord
  mount_uploaders :images, PostImageUploader
  belongs_to :user
end
