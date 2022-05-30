class Post < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :user
  has_many_attached :photos
  has_many :post_likes
  has_many :likes, through: :post_likes

  validates :description, presence: true, length: {maximum: 250}

  scope :my_posts, -> {where(user_id: current_user.id)}

  def date 
    new_date = self.created_at.strftime('%F')
    return new_date
  end

  def post_creator
    user = User.find(self.user_id)
    url = ""
    if user.photo.attached?
      url = url_for(user.photo)
    end
    data = {
      creator_name: user.pet_name,
      prof_pic: url,
      email: user.email,
      id: user.id
    }
    return data
  end
end