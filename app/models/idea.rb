class Idea < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :notes, presence: true
  belongs_to :user
end
