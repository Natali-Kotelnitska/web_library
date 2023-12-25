Rails.application.routes.draw do
  devise_for :users, only: [:sessions, :registrations]

  root "books#index"

  resources :books do
     member do
    get 'view_pdf', to: 'books#view_pdf', as: :view_pdf
  end
  end
end
