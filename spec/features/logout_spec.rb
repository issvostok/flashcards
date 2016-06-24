require 'rails_helper'

describe "Logout." do

  it "User can logout" do
    @user = FactoryGirl.create(:user)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    click_link('Log out')
    expect(page).to have_content 'Sign up or log in.'
  end

end
