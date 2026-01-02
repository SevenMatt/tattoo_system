Rails.application.routes.draw do
  resources :users
  resources :Appointments
  root "appointments#index"
end
