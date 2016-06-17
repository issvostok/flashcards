require 'rails_helper'

describe "User settings." do

  before do
    @user = FactoryGirl.create(:user)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    click_link('Настройки пользователя')
    fill_in('email', with: 'BigDickMaster')
    fill_in('password', with: 'qwerty')
    fill_in('password_confirmation', with: 'qwerty')
    click_button('Update User')
    expect(page).to have_content('User was successfully updated.')
  end
end
