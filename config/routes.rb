Rails.application.routes.draw do
  devise_for :users
  root to: "closets#index"
  resources :users, only: [:edit, :update]
end
