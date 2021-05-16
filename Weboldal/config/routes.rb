Rails.application.routes.draw do
  post 'sessions/create', to: 'sessions#create', as: 'login'
  get 'sessions/destroy', to: 'sessions#destroy', as: 'logout'

  resources 'images', only: [:index, :new, :show] do
    post 'upload', to: 'images#upload', as:'upload', on: :collection

  end

  get 'users/login', to: 'users#login', as: 'loginpage'
  get 'users/new', to: 'users#new', as: 'register'
  post 'users/create', to: 'users#create', as: 'createuser'
  get 'users/forgotten', to: 'users#forgotten', as: 'forgottenpage'
  post 'users/send_forgotten', to: 'users#send_forgotten', as: 'send_forgotten'

  root  to:  'users#login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
