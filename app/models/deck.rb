class Deck < ApplicationRecord
  has_many :cards
  belongs_to :user

  validates :title, presence: true

  def self.find_current_deck
    find_by(current: true)
  end

end
