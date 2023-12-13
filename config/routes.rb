Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations]

  root "books#index"

  resources :books do
    collection do
      get :search
    end
  end
end
