Rails.application.routes.draw do
  resources :cards
  root to: 'home#index', as: :home
end
