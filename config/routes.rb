Rails.application.routes.draw do
  get 'favorites/update'
  root to: 'home#index'
  resources :lists, only: %i[index show new create]
  devise_for :users
end
