class Post < ApplicationRecord
  belongs_to :user
  has_many   :comments
  has_many   :likes, dependent: :destroy
  has_many   :liking_users, through: :likes, source: :user
  has_one    :meal,  dependent: :destroy
  accepts_nested_attributes_for :meal
  enum difficulty: [:challenge, :normal, :easy]
  mount_uploader :image, ImageUploader
  validates :name, :text, presence: true

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) DESC').limit(5).pluck(:post_id))
  end

end