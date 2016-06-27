class SetCurrent
  include Interactor

  def call
    deck = Deck.find(context.id)
    Deck.update_all(current: false)
    deck.update(current: true)
    context.notice = "Deck #{deck.title} is current now"
  end

end
