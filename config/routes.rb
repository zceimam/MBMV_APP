Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/new'
  get 'bookings/destroy'
  devise_for :users
  root to: 'pages#home'

  resources :flats, except: [:edit, :update, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :flats do
    resources :bookings, only: [:new, :create]
  end

  get 'profile', to: 'pages#profile', as: :profile
  get 'bookings', to: 'pages#bookings', as: :bookings
  get 'my_flats', to: 'pages#my_flats', as: :my_flats
end
