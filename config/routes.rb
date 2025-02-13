Rails.application.routes.draw do
  root "books#index"

  resources :books, only: [ :index, :show ] do
    member do
      post "borrow"
      post "return", to: "borrowings#return_book"
    end
  end

  # User routes (assuming users have profiles)
  resources :users, only: [ :show ]
  get "profile", to: "users#show", as: "user_profile"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :borrowings
end
