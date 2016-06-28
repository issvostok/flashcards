require 'rails_helper'

describe "Uploader" do


  it "User can attach his own image to flashpicture from local machine" do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    visit new_card_path
    select @deck.title, from: "card_deck_id"
    fill_in('card_original_text', with: 'Bruce')
    fill_in('card_translated_text', with: 'Wayne')
    page.attach_file(:card_flashpicture, "/#{Rails.root}/spec/fixtures/batman.jpg")
    click_button('Create Card')
    visit home_path
    expect(page).to have_css("img[src*='batman.jpg']")
  end

  it "User can attach his own image to flashpicture from web" do
    @user = FactoryGirl.create(:user)
    @deck = FactoryGirl.create(:deck, user_id: @user.id)
    visit login_path
    fill_in('email', with: 'MyString')
    fill_in('password', with: 'MyString')
    click_button('Log In')
    visit new_card_path
    select @deck.title, from: "card_deck_id"
    fill_in('card_original_text', with: 'Bruce')
    fill_in('card_translated_text', with: 'Wayne')
    fill_in('card_remote_flashpicture_url', with: 'http://blogs-images.forbes.com/markhughes/files/2016/02/BATMAN-V-SUPERMAN-BATMAN-DOLL.jpg')
    click_button('Create Card')
    visit home_path
    expect(page).to have_css("img[src*='thumb_BATMAN-V-SUPERMAN-BATMAN-DOLL.jpg']")
  end

end
