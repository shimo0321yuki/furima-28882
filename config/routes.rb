Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: :show
  resources :purchaser
  resources :items do
    resources :orders
  end
end

