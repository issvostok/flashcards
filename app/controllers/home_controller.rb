class HomeController < ApplicationController
  before_action :require_login
  
  def index
    if current_user.decks.find_current_deck
      @card = current_user.decks.find_current_deck.cards.unreviewed.first
    else
      @card = current_user.cards.unreviewed.first
    end
  end

  def check_translation
    result = CheckTranslation.call(
    answer: params[:answer],
    id: params[:id]
    )
    redirect_to home_path, notice: result.notice
  end

end
