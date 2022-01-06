Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :stories
end
