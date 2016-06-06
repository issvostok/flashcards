Rails.application.routes.draw do
  resources :cards
  root to: 'home#index', as: :home
  post 'check_translation', to: "home#check_translation"
end
