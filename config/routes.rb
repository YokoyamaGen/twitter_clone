# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tweets#new'
  resources :tweets, only: %i[new create show] do
    resources :comments, only: %i[create]
    resource :favorites, only: %i[create destroy]
    resource :retweets, only: %i[create destroy]
    resource :bookmarks, only: %i[create destroy]
  end
  resources :bookmarks, only: %i[index]
  devise_for :users,
             controllers: { registrations: 'users/registrations', sessions: 'users/sessions',
                            confirmations: 'users/confirmations', omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: %i[show edit update] do
    resource :follows, only: %i[create destroy]
    resource :messages, only: %i[show create]
  end

  # post 'messages/:room_id', to: 'messages#create', as: 'create_message'

  devise_scope :user do
    get 'users/confirm_email' => 'users/registrations#confirm_email'
  end
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
end
