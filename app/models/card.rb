class Card < ApplicationRecord
  validates :original_text, presence: true
  validates :translated_text, presence: true
  validates :review_date, presence:  true
  before_save :set_the_date

  protected
    def set_the_date
      self.review_date = DateTime.today
    end
end
