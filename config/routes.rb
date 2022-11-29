Rails.application.routes.draw do
  resources :tickets 
  resources :payments
  resources :places
  resources :schedules
  resources :trains
  devise_for :users
  # get 'home/index'
  root 'home#index'
  get 'passenger_log', to: 'tickets#passenger_log'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

    devise_scope :user do
      get '/users/sign_out' => 'devise/sessions#destroy'
    end

  # Defines the root path route ("/")
  # root "articles#index"
end
