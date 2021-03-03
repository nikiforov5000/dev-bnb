Rails.application.routes.draw do
  devise_for :users

  root to: 'developers#index'
  resources :developers , except: :index do
    resources :bookings, only: [:show, :new, :create]
  end
end
