class DecksController < ApplicationController
  before_action :set_deck, only: [:show, :edit, :update, :destroy]
  before_action :require_login

  def index
    @decks = current_user.decks.all
  end

  def show
    @cards = @deck.cards
  end

  def new
    @deck = current_user.decks.new
  end

  def edit
  end

  def create
    @deck = current_user.decks.new(deck_params)

    respond_to do |format|
      if @deck.save
        format.html { redirect_to @deck, notice: 'Deck was successfully created.' }
        format.json { render :show, status: :created, location: @deck }
      else
        format.html { render :new }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @deck.update(deck_params)
        format.html { redirect_to @deck, notice: 'Deck was successfully updated.' }
        format.json { render :show, status: :ok, location: @deck }
      else
        format.html { render :edit }
        format.json { render json: @deck.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @deck.destroy
    respond_to do |format|
      format.html { redirect_to decks_url, notice: 'Deck was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def set_current
    result = SetCurrentDeck.call(
      id: params[:id],
      user: current_user
    )
    redirect_to decks_path, notice: result.notice
  end

  private
    def set_deck
      @deck = Deck.find(params[:id])
    end

    def deck_params
      params.require(:deck).permit(:title, :user_id)
    end

end
