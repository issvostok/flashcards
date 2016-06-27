Rails.application.routes.draw do
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup' 
  
  resources :users
  resources :cards
  resources :sessions
  resources :decks do
    get 'set_current'
  end
  
  root 'home#index', as: :home
  post 'check_translation', to: 'home#check_translation'
  # post 'set_current_deck', to: 'decks#set_current_deck'
end
