class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  belongs_to_active_hash :prefecture
  has_many   :comments, dependent: :destroy
  has_many   :comment_users, through: :comments, source: :user
  has_many   :likes, dependent: :destroy
  has_many   :liking_users, through: :likes, source: :user
  has_one    :meal,  dependent: :destroy
  accepts_nested_attributes_for :meal
  enum difficulty: [:challenge, :normal, :easy]
  mount_uploader :image, ImageUploader
  validates :name, :text, :prefecture, presence: true

  def self.create_all_ranks
    Post.find(Like.group(:post_id).order('count(post_id) DESC').limit(20).pluck(:post_id))
  end

end