Rails.application.routes.draw do
  devise_for :users

  root to: 'developers#index'
  resources :developers , except: :index do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: :show do
    resources :reviews, only: [:new, :create]
  end
end
