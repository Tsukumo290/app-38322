Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: "closets#index"
  resources :users, only: [:edit, :update]
  resources :closets, only: [:index, :new, :create, :show, :destroy] do
    resources :memos, only: [:create, :destroy]
    resource :favorites, only: [:create]
    collection do
      get 'stats'
    end
  end
  resources :calendars, only: [:index, :new, :create, :destroy ]
end
