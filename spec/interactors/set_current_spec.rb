require 'rails_helper'

describe SetCurrentDeck do
  before do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
  end

  it "#call setup current deck and send notice" do
    interactor = SetCurrentDeck.call(id: @deck.id, user: @user )
    expect(interactor).to be_a_success
    expect(interactor.notice).to eq "Deck MyString is current now"
  end
end
