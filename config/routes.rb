Rails.application.routes.draw do
  devise_for :users

  root to: 'developers#index'
  resources :developers , except: :index do
    resources :bookings, only: [:new, :create]
    resources :developer_skills, only: [:new, :create]
  end
  resources :developer_skills, only: :destroy
  resource :dashboard, only: :show
  resources :bookings, only: [:show, :index] do
    resources :reviews, only: [:new, :create]
  end

  resources :bookings, only: :update
end
