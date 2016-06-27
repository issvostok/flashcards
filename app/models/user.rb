class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :decks
  has_many :cards

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true

  # scope :current_deck, -> { joins(:decks) }

end
