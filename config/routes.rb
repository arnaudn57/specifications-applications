Rails.application.routes.draw do
  devise_for :users
  root to: "dashboards#index"
  resources :specifications, only: [:new, :create, :edit, :update, :show, :destroy]
  resources :dashboards, only: [:index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
