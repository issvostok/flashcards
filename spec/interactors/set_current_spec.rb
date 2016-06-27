require 'rails_helper'

describe SetCurrentDeck do
  before do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
  end

  it "#call setup current deck and send notice" do
    interactor = SetCurrentDeck.call(deck_id: @deck.id, user_id: @user.id )
    expect(interactor).to be_a_success
    expect(interactor.notice).to eq "Deck MyString is current now"
  end
end
