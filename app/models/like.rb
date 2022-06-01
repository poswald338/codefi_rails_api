class Like < ApplicationRecord
  belongs_to :user
  # has_many :post_likes
  # has_many :posts, through: :post_likes
end