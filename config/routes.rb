Rails.application.routes.draw do
  root "static_pages#home"
  get "help" => "static_pages#help"
  get "about" => "static_pages#about"
  get "logout" => "devise/sessions#destroy"
  
  namespace :admin do
    resources :books
  end

  devise_for :users
end
