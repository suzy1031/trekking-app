class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_many :likes, dependent: :destroy
  enum difficulty: [:challenge, :normal, :easy]
  mount_uploader :image, ImageUploader
  validates :name, :text, presence: true

  def liked?(user)
    likes.where(user_id: user.id).exists?
  end

end