class Card < ApplicationRecord
  validates :original_text, presence: true
  validate :equality_test, on: :create
  validates :translated_text, presence: true
  before_create :set_the_date

  def equality_test
    errors.add(:original_text, "Original can't be equal to translated") if self.original_text.downcase.strip == self.translated_text.downcase.strip
  end

  scope :unreviewed, -> { where('review_date <= ?', Date.current).order('RANDOM()') }

  protected
  def set_the_date
    self.review_date = Date.current
  end
    
end
