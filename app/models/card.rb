class Card < ApplicationRecord
  validates :original_text, presence: true
  validate :equality_test, on: :create
  validates :translated_text, presence: true
  before_create :set_the_date

  def equality_test
    errors.add(:original_text, "Original can't be equal to translated") if self.original_text.downcase ==self.translated_text.downcase
  end

  scope :unreviewed, -> { where('review_date <= ?', Date.current).order('RANDOM()').first }

  def check_translation(answer)
    if original_text.downcase == answer.downcase
      update(review_date: 3.days.since)
      return true
    else
      return false
    end
  end

  protected
  def set_the_date
    self.review_date = Date.current
  end
    
end
