Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :Appointments
  root "appointments#index"
end
