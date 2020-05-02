Rails.application.routes.draw do
  get 'favorites/update'
  root to: 'lists#index'
  resources :lists, only: %i[index show new create] do
    get 'favorite', on: :collection
  end
  devise_for :users
end
