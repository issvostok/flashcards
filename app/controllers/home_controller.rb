class HomeController < ApplicationController
  
  def index
    @card = Card.unreviewed
  end

  def check_translation
    @card = Card.find(params[:id])
    if @card.check_translation(params[:answer])
      flash[:notice] = "Correct"
    else
      flash[:notice] = "Incorrect"
    end
    redirect_to home_path
  end

end
