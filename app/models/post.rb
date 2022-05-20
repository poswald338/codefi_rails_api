class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :post_likes
  has_many :likes, through: :post_likes

  validates :description, presence: true, length: {maximum: 250}
end