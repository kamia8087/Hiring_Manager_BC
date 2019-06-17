Rails.application.routes.draw do
  root 'sessions#new'
  get "/auth/:provider/callback" => 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :sessions, only: :index
  resources :applications
  resources :interviews
  resources :feedbacks
end
