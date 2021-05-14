Rails.application.routes.draw do
  resources 'images', only: [:index, :new, :show]
  get 'images/new'
  get 'images/show'
  get 'users/login'
  get 'users/new'
  post 'users/create'
  get 'users/forgotten'
  post 'users/send_forgotten'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
