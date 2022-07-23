class Link < ApplicationRecord
  validates_presence_of :title, :link_address
  belongs_to :user

  validates :title, presence: true
  validates :link_address, presence: true
end
