class CheckTranslation
  include Interactor

  def call
    card = Card.find(context.id)
    if card.original_text.downcase.strip == context.answer.downcase.strip
      card.update(review_date: 3.days.since)
      context.notice = "Correct"
    else
      context.notice = "Incorrect"
    end
  end

end