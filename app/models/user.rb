class User < ApplicationRecord
  has_secure_password
  has_many :links
  has_one :appearance

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
