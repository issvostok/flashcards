class Deck < ApplicationRecord
  has_many :cards
  belongs_to :user

  validates :title, presence: true
end
