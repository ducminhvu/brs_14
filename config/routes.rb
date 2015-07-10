Rails.application.routes.draw do
  devise_for :users

  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "logout" => "devise/sessions#destroy"
  
  resources :books, only: [:index, :show]
  
  namespace :admin do
    root "dashboards#index"
    resources :books
    resources :users
    resources :categories
    resources :requests
  end
end
