Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => 'omniauth_callbacks', registrations: 'registrations' }

  root "static_pages#home"

  resources :books, only: [:index, :show]
  resource :address, only: [:update]
end
