Rails.application.routes.draw do
  resources :cards, only: [:index, :show]
  root to: 'home#index'
end
