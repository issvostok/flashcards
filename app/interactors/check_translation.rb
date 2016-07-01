require "damerau-levenshtein"

class CheckTranslation
  include Interactor

  def call
    card = Card.find(context.id)
    context.card = card
    original = simplify_word(card.original_text)
    answer = simplify_word(context.answer) 
    if original == answer
      card.increment!(:correct_streak, 1)
      card.update(review_date: choose_leitner_time(card.correct_streak), incorrect_streak: 0)
      context.notice = "Correct"
    else
      if original.length > 2 and dlevenstein_check(answer, original)
        context.notice = "Typo. Your answer is #{answer}, but correct answer is #{original}."
      else
        card.increment!(:incorrect_streak, 1)
        card.update(correct_streak: 0, incorrect_streak: 0) if card.incorrect_streak >= 3
        context.notice = "Incorrect"
      end
    end
  end

  def dlevenstein_check(user_answer, original_text)
    dl = DamerauLevenshtein
    dlevenstein_length = 1
    dl.distance(user_answer, original_text) <= dlevenstein_length
  end

  def simplify_word(word)
    word.downcase.strip
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
