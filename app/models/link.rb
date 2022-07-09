class Link < ApplicationRecord
  validates_presence_of :title, :link_address
  belongs_to :user
end
