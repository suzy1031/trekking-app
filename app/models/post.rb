class Post < ApplicationRecord
  belongs_to :user
  enum difficulty: [:challenge, :normal, :easy]
  mount_uploader :image, ImageUploader
  validates :name, :text, presence: true
end