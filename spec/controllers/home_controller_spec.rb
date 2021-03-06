require 'rails_helper'
require 'rails-controller-testing'

RSpec.describe HomeController, type: :controller do
  before do
    @deck = FactoryGirl.create(:deck)
    @user = FactoryGirl.create(:user)
    login_user
  end

  describe 'GET #index' do
    it 'responds successfully with an HTTP 200 status code' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe '#check_translation' do
    it 'should redirect to home_path with notice' do
      card = Card.create(original_text: 'Drachen', translated_text:'Dragon', user_id: @user.id, deck_id: @deck.id)
      get :check_translation, params: {id: card.id, answer: ' dRaChEn '}
      expect(flash[:notice]).to eq ('Correct')
      expect(response).to redirect_to(home_path)
    end
  end
  
end
