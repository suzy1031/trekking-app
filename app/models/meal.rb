class Meal < ApplicationRecord
  belongs_to :post
  validates :name, :cooking_time, presence: true
  validates :cooking_time, numericality: { only_integer: true }
  mount_uploader :image, ImageUploader
end