class HomeController < ApplicationController
  
  def index
    @card = Card.unreviewed
  end

  def check_translation
    @card = Card.find(params[:id])
    flash[:notice] = @card.check_translation(params[:answer]) ? "Correct" : "Incorrect"
    redirect_to home_path
  end

end
