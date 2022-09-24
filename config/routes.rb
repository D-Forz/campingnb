Rails.application.routes.draw do
  get 'bookmarks/create'
  get 'bookmarks/destroy'
  get 'reviews/create'
  get 'reviews/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :bookmarks
  resources :camps do
    resources :reviews
    resources :camp_supplies
  end
end
