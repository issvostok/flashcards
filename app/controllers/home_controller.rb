class HomeController < ApplicationController
  
  def index
    @card = Card.unreviewed
  end

  def check_translation
    result = CheckTranslation.call(
    answer: params[:answer],
    id: params[:id]
    )
    redirect_to home_path, notice: result.notice
  end

end
