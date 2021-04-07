Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  resources :users
  resources :rehabilitations,only:[:index,:new,:create,:show,:edit,:update,:destroy]
end
