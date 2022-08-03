class Link < ApplicationRecord
  validates_presence_of :title, :link_address
  belongs_to :user

  # input data validation for those who don't use frontend input fields
  validates :title, presence: true, length: {maximum: 100}
  validates :link_address, presence: true, format: { with: /(https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|www\.[a-zA-Z0-9][a-zA-Z0-9-]+[a-zA-Z0-9]\.[^\s]{2,}|https?:\/\/(?:www\.|(?!www))[a-zA-Z0-9]+\.[^\s]{2,}|www\.[a-zA-Z0-9]+\.[^\s]{2,})/ }

  def self.find_by_user(username)
    user_id = User.find_by_username(username).id
    return self.where(user_id: user_id)
  end
end
