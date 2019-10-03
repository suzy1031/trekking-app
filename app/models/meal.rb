class Meal < ApplicationRecord
  belongs_to :user
  validates :name, :cooking_time, presence: true
  mount_uploader :image, ImageUploader
end