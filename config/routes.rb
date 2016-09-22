Rails.application.routes.draw do
  namespace :api do
    resources :warehouses, only: [:index] do
      resources :storage_items, only: [:index]
    end

    resources :products, only: [:index]

    resources :orders, only: [:create, :update]
  end
end
