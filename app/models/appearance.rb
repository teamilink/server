class Appearance < ApplicationRecord
  belongs_to :user
  has_one_attached :picture, service: :amazon

  def picture_url
    Rails.application.routes.url_helpers.url_for(picture) if picture.attached?
  end

end
