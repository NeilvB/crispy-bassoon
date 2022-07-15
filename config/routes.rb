Rails.application.routes.draw do
  root 'sessions#new'

  post 'session', to: 'sessions#create'

  get 'courses', to: 'courses#index'
  get 'courses/:id/edit', to: 'courses#edit', as: 'edit_course'
  
  patch 'course_user/:id', to: 'courses_users#update', as: 'courses_user'
end
