Rails.application.routes.draw do
  root to: "root#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :groups, only: [:new, :index]
  resources :budgets, only: [:new, :index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
