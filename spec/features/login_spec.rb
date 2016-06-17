require 'rails_helper'

describe "Login." do

  it "User can login in app" do
    @user = FactoryGirl.create(:user)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    expect(page).to have_content "Первый в мире удобный менеджер флеш-карточек. Именно так."
  end

  it "Redirecting back to the previous page after login" do
    visit cards_path
    @user = FactoryGirl.create(:user)
    @card = FactoryGirl.create(:card, user_id: @user.id)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    expect(page).to have_content "User ID"
  end

end
