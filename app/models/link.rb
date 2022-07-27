class Link < ApplicationRecord
  validates_presence_of :title, :link_address
  belongs_to :user

  validates :title, presence: true
  validates :link_address, presence: true

  def self.find_by_user(username)
    user_id = User.find_by_username(username).id
    return self.where(user_id: user_id)
  end
end
