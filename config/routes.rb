Rails.application.routes.draw do
  root "books#index"

  resources :books

  devise_for :users
  # devise_for :users, skip: :all
end
