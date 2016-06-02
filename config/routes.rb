Rails.application.routes.draw do
  resources :cards
  root to: 'home#index', as: :home
  post '/cards/:id' => 'cards#show'
  post '/cards/:id/edit' => 'cards#edit'
end
