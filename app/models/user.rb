class User < ApplicationRecord
  has_secure_password
  has_many :links
  has_one :appearance

  validates :username, presence: true, length: {maximum: 30}, uniqueness: true, format: { with: /[a-z0-9_-]{4,30}/ }

  validates :email, presence: true, uniqueness: true
end
