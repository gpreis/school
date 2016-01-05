Rails.application.routes.draw do
  root 'statics#home'
  resources :students
  resources :courses
end
