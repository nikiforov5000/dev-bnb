Rails.application.routes.draw do
  get 'developers/new'
  get 'developers/create'
  devise_for :users
  # root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'developers#index'
  resources :developers , except: :index
  # get "developers/:id", to: "developers#show" # , as: :developer
end
