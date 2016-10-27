class Idea < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :notes, presence: true
  belongs_to :user
  has_many :image_ideas
  has_many :images, through: :image_ideas
end
