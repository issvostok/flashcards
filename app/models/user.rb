class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :decks
  has_many :cards

  validates_confirmation_of :password
  validates :password, presence: true, on: :create
  validates :email, presence: true, uniqueness: true

  def current_deck
    decks.where(current: true).first
  end

end
