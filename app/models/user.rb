class User < ActiveRecord::Base
  has_many :characters
  has_secure_password
  validates :username, presence: true #validates that username is present
  validates :username, uniqueness: true
end