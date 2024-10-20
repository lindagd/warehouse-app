Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :warehouses
  resources :suppliers, only: [:index, :new, :create, :show, :edit, :update]
  resources :product_models, only: [:index, :new, :create, :show]
  resources :orders, only: [:new, :create, :show]
end
