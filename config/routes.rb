# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :guests, class_name: 'Users::Guest', skip: :all
  devise_for :admins, class_name: 'Users::Admin', skip: :all

  devise_scope :guest do
    resources :guests, only: :create, controller: 'guests/registrations' do
      collection do
        post :sign_in, to: 'guests/sessions#create'
        delete :sign_out, to: 'guests/sessions#destroy'
      end
    end
  end

  devise_scope :admin do
    resources :admins, only: :create, controller: 'admins/registrations' do
      collection do
        post :sign_in, to: 'admins/sessions#create'
        delete :sign_out, to: 'admins/sessions#destroy'
      end
    end
  end

  namespace :admins do
    resources :articles, only: :create
  end

  namespace :guests do
    resources :articles, only: %i[index show]
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
