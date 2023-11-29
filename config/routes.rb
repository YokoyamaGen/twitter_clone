# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tweets#index'
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions', confirmations: 'users/confirmations',  }
  devise_scope :user do
    get 'users/confirm_email' => 'users/registrations#confirm_email'
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
