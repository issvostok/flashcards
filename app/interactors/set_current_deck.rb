class SetCurrentDeck
  include Interactor

  def call
    if Deck.find(context.deck_id) && User.find(context.user_id)
      deck = Deck.find(context.deck_id)
      user = User.find(context.user_id)
      user.decks.update(current: false)
      deck.update(current: true)
      context.notice = "Deck #{deck.title} is current now"
    else
      context.notice = "Deck wasn't found"
    end
  end

end
