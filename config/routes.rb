Rails.application.routes.draw do
  root to: "root#index"
  devise_for :users, controllers: { registrations: "registrations" }
  resources :groups, only: [:new, :create, :index, :show]
  resources :budgets, only: [:new, :create, :index]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
