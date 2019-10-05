class Like < ApplicationRecord
  # counter_cahce: :likes_countはリレーションされているlikeの数の値をリレーション先のlikes_countというカラムの値に入れますよって意味
  # tweet.like_countとするだけでそのツイートに結びつくlike数が表示される
  belongs_to :post, counter_cache: :likes_count
  belongs_to :user
end
