require 'rails_helper'

describe "The main page." do

  before do
    @user = FactoryGirl.create(:user)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    visit home_path
  end

  it "User can see main page" do
    expect(page).to have_content "Первый в мире удобный менеджер флеш-карточек. Именно так."
  end

  it "User will see 'correct' if answer is ok." do
    card = FactoryGirl.create(:card, user_id: @user.id)
    visit home_path
    fill_in "answer", with: card.original_text
    click_button "Check!"
    expect(page).to have_content "Correct"
  end

  it "User will see 'incorrect' if answer isn't' ok." do
    card = FactoryGirl.create(:card, user_id: @user.id)
    visit home_path
    fill_in "answer", with: 'Sieg Heil!'
    click_button "Check!"
    expect(page).to have_content "Incorrect"
  end
end
