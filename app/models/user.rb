class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :email, presence: :true, uniqueness: true
  validates :name, presence: :true
  has_many :ideas
end
