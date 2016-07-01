require "damerau-levenshtein"

class CheckTranslation
  include Interactor

  def call
    dl = DamerauLevenshtein
    card = Card.find(context.id)
    if card.original_text.downcase.strip == context.answer.downcase.strip
      card.increment!(:correct_streak, 1)
      card.update(review_date: choose_leitner_time(card.correct_streak), incorrect_streak: 0)
      context.notice = "Correct"
      context.card = card
    elsif dl.distance(card.original_text.downcase.strip, context.answer.downcase.strip) <= 2
      context.notice = "Typo. Your answer is #{context.answer}, but correct answer is #{card.original_text}."
      context.card = card
    else
      card.increment!(:incorrect_streak, 1)
      card.update(correct_streak: 0, incorrect_streak: 0) if card.incorrect_streak >= 3
      context.notice = "Incorrect"
      context.card = card
    end
  end

  def choose_leitner_time(card_correct_streak)
    case card_correct_streak
    when 1
      12.hours.since
    when 2
      3.days.since
    when 3
      1.week.since
    when 4
      2.week.since
    when 5
      1.month.since 
    else
      1.month.since
    end    
  end

end
