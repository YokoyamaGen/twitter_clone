# frozen_string_literal: true

Rails.application.routes.draw do
  get 'users/show'
  root to: 'tweets#index'
  resources :tweets, only: [:index]
  devise_for :users,
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions',
                            confirmations: 'users/confirmations', omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'users/confirm_email' => 'users/registrations#confirm_email'
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
