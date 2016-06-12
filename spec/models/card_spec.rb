require 'rails_helper'

RSpec.describe Card, :type => :model do

  context "#equality_test" do
    it "card isn't valid when original and translated text is equal" do
      card = Card.new(original_text: "Hi", translated_text: "hi ")
      expect(card).not_to be_valid
    end

    it "card isn't valid when original or translated text is empty" do
      card = Card.new(original_text: "", translated_text: "Nice Text")
      expect(card).not_to be_valid
      card = Card.new(original_text: "Nice Text", translated_text: "")
      expect(card).not_to be_valid
    end

    it "card isn't valid when original or translated text is nil" do
      card = Card.new(original_text: nil, translated_text: "Nice Text")
      expect{ card.save }.to raise_error
      card = Card.new(original_text: "Nice Text", translated_text: nil)
      expect{ card.save }.to raise_error
    end
  end

  context "#set_the_date" do
    it "set the date for current card" do
      card = Card.create(original_text: "Hallo", translated_text: "Hi")
      expect(card.review_date).to eq(Date.current)
    end
  end
end
