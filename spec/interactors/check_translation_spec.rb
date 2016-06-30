require 'rails_helper'

describe CheckTranslation do
  before do
    @answer = '   DracHeN '
    @card = FactoryGirl.create(:card)
  end

  it "#call tests answer and original text for equality" do
    interactor = CheckTranslation.call(answer: @answer, id: @card.id )
    expect(interactor).to be_a_success
    expect(interactor.notice).to eq "Correct"
  end

  it "#call set a currect Leitner time" do
    interactor = CheckTranslation.call(answer: @answer, id: @card.id )
    expect(@card.review_date).to eq(1.month.since)
  end
  
end