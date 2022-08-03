class User < ApplicationRecord
  has_secure_password
  has_many :links
  has_one :appearance

  # input data validation for those who don't use frontend input fields
  validates :username, presence: true, length: {maximum: 30}, uniqueness: true, format: { with: /\A[a-z0-9_-]{4,30}\z/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A(.+)@(.+)$\z/ }
end
