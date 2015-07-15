Rails.application.routes.draw do
  devise_for :users

  root "books#index"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "logout" => "devise/sessions#destroy"

  resources :readings, only: :index
  resources :books, only: [:index, :show]
  resources :reviews, only: :destroy
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :reviews
  end
  resources :favorites, only: [:create, :destroy]
  resources :reviews do
    resources :comments
  end
  resources :users do
    resources :requests
    resources :favorites, only: [:index]
  end
  resources :activities do
    resources :likes, only: [:create, :destroy]
  end

  namespace :admin do
    root "dashboards#index"
    resources :books
    resources :users
    resources :categories
    resources :requests
  end
  get "users/:id/:type" => "relationships#index", as: "follows"
end
