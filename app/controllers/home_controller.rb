class HomeController < ApplicationController
  before_action :require_login
  
  def index
    @card = current_user.cards.unreviewed.first
  end

  def check_translation
    result = CheckTranslation.call(
    answer: params[:answer],
    id: params[:id]
    )
    redirect_to home_path, notice: result.notice
  end

end
