Rails.application.routes.draw do

	devise_for :admin_users, ActiveAdmin::Devise.config

  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks' }
  resources :users
  
  root to: 'home#index'
  ActiveAdmin.routes(self)

end