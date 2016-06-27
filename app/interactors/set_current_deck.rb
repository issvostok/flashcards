class SetCurrentDeck
  include Interactor

  def call
    if context.user.decks.where(id: context.id).count > 0
      deck = Deck.find(context.id)
      user = User.find(context.user)
      user.decks.update(current: false)
      deck.update(current: true)
      context.notice = "Deck #{deck.title} is current now"
    else
      context.notice = "Deck wasn't found. Permission denied."
    end
  end

end
