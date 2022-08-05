class Appearance < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, service: :amazon

  # input data validation for those who don't use frontend input fields
  validates :profile_title, length: {maximum: 30}, presence: true
  validates :bio, length: {maximum: 80}, presence: true

  before_save :picture_url
  
  def picture_url
    picture.blob.url if picture.attached?
  end

  def self.find_by_user_id(username)
    user_id = User.find_by_username(username).id
    return self.where(user_id: user_id)
  end

end
