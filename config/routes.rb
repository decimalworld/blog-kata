# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :guests, class_name: 'Users::Guest', skip: :all
  devise_for :admins, class_name: 'Users::Admin', skip: :all

  devise_scope :guest do
    resources :guests, only: :create, controller: 'guest/registrations' do
      collection do
        post :sign_in, to: 'guest/sessions#create'
        delete :sign_out, to: 'guest/sessions#destroy'
      end
    end
  end

  devise_scope :admin do
    resources :admins, only: :create, controller: 'admin/registrations' do
      collection do
        post :sign_in, to: 'admin/sessions#create'
        delete :sign_out, to: 'admin/sessions#destroy'
      end
    end
  end

  get 'up' => 'rails/health#show', as: :rails_health_check
end
