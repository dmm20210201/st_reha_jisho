Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  root to: 'homes#top'
  get 'homes/about'
  resources :users, only: [:show, :edit, :update, :destroy]
  resources :rehabilitations, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :rehabilitation_comments, only: [:create, :destroy]
  end
end
