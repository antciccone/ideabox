class User < ApplicationRecord
  has_secure_password
  validates_confirmation_of :password
  validates :email, uniqueness: true
  has_many :ideas 
end
