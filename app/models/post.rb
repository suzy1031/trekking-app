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

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) DESC').limit(5).pluck(:post_id))
  end

end