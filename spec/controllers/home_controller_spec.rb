require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe HomeController, :type => :controller do
  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template('index')
    end
  end

  before do
    @answer = '   lOl '
    @card = Card.create(original_text: 'Lol', translated_text: 'laugh')
  end

  it "#check_translation tests http-status and notice" do
    result = CheckTranslation.call(answer: @answer, id: @card.id )
    expect(result.notice).to eq "Correct"
    expect(response).to have_http_status(200)
  end
end
