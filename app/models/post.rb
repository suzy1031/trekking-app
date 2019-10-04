class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments
  enum difficulty: [:challenge, :normal, :easy]
  mount_uploader :image, ImageUploader
  validates :name, :text, presence: true
end