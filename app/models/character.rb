class Character < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true #validates that name is present
  validates :name, uniqueness: true
end