class Appearance < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, service: :amazon

  def picture_url
    # Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
    picture.blob.url if picture.attached?
    # if picture.attached?
    #   blob = ActiveStorage::Blob.last
    #   blob.url(virtual_host: true) 
    # end    
    
  end

end
