Rails.application.routes.draw do
  root to: 'home#index'
  resources :lists, only: %i[index show]
  
  devise_for :users
end
