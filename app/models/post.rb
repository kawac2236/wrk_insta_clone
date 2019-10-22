class Post < ApplicationRecord
  mount_uploaders :images, PostImageUploader
end
