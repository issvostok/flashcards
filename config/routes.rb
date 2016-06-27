Rails.application.routes.draw do
  get 'logout' => 'sessions#destroy', :as => 'logout'
  get 'login' => 'sessions#new', :as => 'login'
  get 'signup' => 'users#new', :as => 'signup' 
  
  resources :users
  resources :cards
  resources :sessions
  resources :decks
  
  root 'home#index', as: :home
  post 'check_translation', to: 'home#check_translation'
  post 'set_current', to: 'decks#set_current'
end
