Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
  # get 'item/:id', to: 'item#price'
    resources :orders
  end
end

