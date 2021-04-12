Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :users, only: [:show, :edit, :update]
  resources :rehabilitations, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :rehabilitation_comments, only: [:create, :destroy]
  end
end
