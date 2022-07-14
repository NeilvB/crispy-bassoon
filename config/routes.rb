Rails.application.routes.draw do
  root 'courses#index'

  get '/login', to: 'logins#new'
  post '/login', to: 'logins#create'
  delete 'login', to: 'logins#destroy'

  resources :courses

  resources :user_course_ratings, only: [:create, :update]
end
