class Appearance < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, service: :amazon

  validates :profile_title, length: {maximum: 30}, presence: true
  validates :bio, length: {maximum: 80}, presence: true

  before_save :picture_url
  
  def picture_url
    # Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
    picture.blob.url if picture.attached?
    # if picture.attached?
    #   blob = ActiveStorage::Blob.last
    #   blob.url(virtual_host: true) 
    # end    
    
  end

  def self.find_by_user_id(username)
    user_id = User.find_by_username(username).id
    return self.where(user_id: user_id)
  end

end
