FactoryGirl.define do
  factory :card do
    original_text "Drachen"
    translated_text "Dragon"
    user
    deck
  end
end
