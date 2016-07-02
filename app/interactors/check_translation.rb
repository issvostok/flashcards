require "damerau-levenshtein"

class CheckTranslation
  include Interactor
  
  TYPOS_ALLOWED = 1

  def call
    context.card = Card.find(context.id)
    original, answer = setup_words()
    if equal?(original, answer)
      correct_answer!
      context.notice = "Correct"
    elsif typos?(original, answer)
      correct_answer!
      context.notice = "Typo. Your answer is #{answer}, but correct answer is #{original}."
    else
      incorrect_answer!
      context.notice = "Incorrect"
    end
  end

  def equal?(original, answer)
    original == answer
  end

  def typos?(original, answer)
    if original.length > 2
      DamerauLevenshtein.distance(answer, original) <= TYPOS_ALLOWED
    else
      false
    end
  end

  def correct_answer!
    context.card.increment!(:correct_streak, 1)
    context.card.update(review_date: choose_leitner_time(context.card.correct_streak), incorrect_streak: 0)
  end

  def incorrect_answer!
    context.card.increment!(:incorrect_streak, 1)
    context.card.update(correct_streak: 0, incorrect_streak: 0) if context.card.incorrect_streak >= 3
  end

  def setup_words
    original = simplify_word(context.card.original_text)
    answer = simplify_word(context.answer) 
    [original, answer]
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
