class Post < ApplicationRecord
  enum difficulty: [:challenge, :normal, :easy]
  mount_uploader :image, ImageUploader
end