Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations', sessions: 'sessions' }

  root "static_pages#home"

  resources :books, only: [:index, :show]
  resource :address, only: [:update]
  resources :reviews, only: [:create]
  resource :cart, only: [:show, :update, :add_coupon, :destroy_order_item] do
    collection do
      put :add_coupon
      delete :destroy_order_item
    end
  end
end
