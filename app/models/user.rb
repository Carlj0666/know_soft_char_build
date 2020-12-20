class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true #validates that username is present
  validates :username, uniqueness: true
  # has_many :characters
end