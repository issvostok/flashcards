class Card < ApplicationRecord
  belongs_to :deck
  belongs_to :user

  mount_uploader :flashpicture, FlashpictureUploader

  validates :user_id, presence: true
  validates :original_text, presence: true
  validate :equality_test, on: :create
  validates :translated_text, presence: true
  before_create :set_the_date

  def equality_test
    errors.add(:original_text, "Original can't be equal to translated") if self.original_text.downcase.strip == self.translated_text.downcase.strip
  end

  scope :unreviewed, -> { where('review_date <= ?', Date.current).order('RANDOM()') }
  scope :current_deck, -> { decks.where(current: true) }

  protected
  def set_the_date
    self.review_date = Date.current
  end
    
end
