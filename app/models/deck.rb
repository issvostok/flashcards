class Deck < ApplicationRecord
  has_many :cards
  belongs_to :user

  validates :title, presence: true

  scope :current_deck, -> { where(current: true) }
end
