class CardsController < ApplicationController
  before_action :fetch_card, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @cards = current_user.cards.all
  end

  def show
    @user = current_user
  end

  def new
    @card = current_user.cards.new
  end

  def edit
  end

  def create
    @card = current_user.cards.new(card_params)
    if card_params[:remote_flashpicture_url]
      @card.remote_flashpicture_url = card_params[:remote_flashpicture_url]
    end
    if @card.save!
      redirect_to cards_path
    else
      render :new
    end
  end

  def update
    if @card.update!(card_params)
      redirect_to cards_path
    else
      render 'edit'
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private
  
  def fetch_card
    @card = current_user.cards.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:review_date, :original_text, :translated_text, :user_id, :deck_id, :flashpicture, :remote_flashpicture_url)
  end


end