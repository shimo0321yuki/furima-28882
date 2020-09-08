Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:edit, :update] 
  resources :items, only: [:index, :search, :show, :create, :update, :new] 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

