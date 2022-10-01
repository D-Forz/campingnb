Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookmarks
  resources :camps do
    resources :reviews, only: :create
    resources :bookings, only: %i[new create show]
  end
  resources :bookings, only: %i[index destroy]
  resources :reviews, only: :destroy
end
