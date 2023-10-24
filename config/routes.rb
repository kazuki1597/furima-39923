Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  resources :items, only: [:new,:create,:show,:edit,:update,] do
    resources :articles
    resources :purchase_informations, only: [:index,:create]
  end
end
