Rails.application.routes.draw do
  root 'courses#index'

  resources :logins, only: [:new, :create]

  resources :courses

  resources :user_course_ratings, only: [:create, :update]
end
