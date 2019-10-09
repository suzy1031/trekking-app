class Meal < ApplicationRecord
  belongs_to :post
  validates :name, :cooking_time, presence: true
  mount_uploader :image, ImageUploader
end