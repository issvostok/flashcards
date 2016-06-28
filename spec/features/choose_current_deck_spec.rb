require 'rails_helper'

describe "Choose current deck" do

  it "User can choose deck and will see notice about that" do
    @user = FactoryGirl.create(:user)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
    visit decks_path
    click_button('Set current')
    expect(page).to have_content "Deck MyString is current now"
  end

end
