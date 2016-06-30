require 'rails_helper'

describe CheckTranslation do
  before do
    @answer = '   DracHeN '
    @card = FactoryGirl.create(:card, correct_streak: 5, incorrect_streak: 2)
  end

  it "#call tests answer and original text for equality" do
    interactor = CheckTranslation.call(answer: @answer, id: @card.id )
    expect(interactor).to be_a_success
    expect(interactor.notice).to eq "Correct"
  end

  it "#call set a currect Leitner time after correct answer" do
    interactor = CheckTranslation.call(answer: @answer, id: @card.id )
    expect(interactor.card.review_date.strftime("%F")).to eq(1.month.since.strftime("%F"))
  end

  it "#call reset a correct/incorrect streak after three mistakes" do
    interactor = CheckTranslation.call(answer: 'mistake', id: @card.id)
    expect(interactor.card.correct_streak).to eq(0)
  end
  
end
