Rails.application.routes.draw do
  root 'sessions#new'

  post 'session', to: 'sessions#create'

  get 'courses', to: 'courses#index'
  get 'courses/:id', to: 'courses#show', as: 'course'
end
