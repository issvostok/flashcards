require 'rails_helper'

describe CheckTranslation do
  before do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
  end

  it "#call tests answer and original text for equality" do
    interactor = SetCurrent.call(id: @deck.id )
    expect(interactor).to be_a_success
    expect(interactor.notice).to eq "Deck MyString is current now"
  end
end
