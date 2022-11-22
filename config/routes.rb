Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  resources :athletes, only: [:index, :new, :create, :show, :edit, :update] do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update]
  get "/dashboard", to: "pages#dashboard"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
end
