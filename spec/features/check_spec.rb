describe 'Learning a new words' do

  context "Can see main page"
    it "Main page" do
      visit home_path
      expect(page).to have_content "Первый в мире удобный менеджер флеш-карточек. Именно так."
    end

  context "Trainer" do

    it "Will see 'correct' if translate is correct" do
      visit home_path
      fill_in 'answer', with: @card.original_text
      click_button "Check!"
      expect(page).to have_content "Correct"
    end
    
    it "Will see 'incorrect' if translate is incorrect" do
      visit home_path
      fill_in 'answer', with: "Sieg Heil!"
      click_button "Check!"
      expect(page).to have_content "Incorrect"
    end

  end
end