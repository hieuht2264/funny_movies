Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root to: 'dashboard#index'
  resources :videos, only: [:new, :create]
end
