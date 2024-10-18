Rails.application.routes.draw do
  root to: 'home#index'

  resources :warehouses
  resources :suppliers, only: [:index, :new, :create, :show, :edit, :update]
  resources :product_models, only: [:index, :new, :create, :show]
end
