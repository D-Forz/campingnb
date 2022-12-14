Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :camps do
    resources :reviews, only: :create
    resources :bookings, only: %i[create]
    collection do
      get "my_camps"
    end
  end
  resources :bookings, only: %i[index destroy]
  resources :reviews, only: :destroy
end
