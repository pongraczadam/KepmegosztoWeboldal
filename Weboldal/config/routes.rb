Rails.application.routes.draw do
  post 'sessions/create', to: 'sessions#create', as: 'login'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'
  resources 'images', only: [:index, :new, :show]
  get 'images/', to: 'images#index', as: 'imagesindex'
  get 'users/login', to: 'users#login', as: 'loginpage'
  get 'users/new'
  post 'users/create'
  get 'users/forgotten'
  post 'users/send_forgotten'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
