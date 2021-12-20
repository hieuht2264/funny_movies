# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  root to: 'dashboard#index'
  resources :videos, only: %i[new create] do
    resource :like, only: :update, controller: 'videos/like'
    resource :dislike, only: :update, controller: 'videos/dislike'
  end
end
