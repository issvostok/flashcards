class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def new
    @cards = Card.new
  end
end
