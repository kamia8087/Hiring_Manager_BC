Rails.application.routes.draw do
  root 'sessions#new'
  get "/auth/:provider/callback" => 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  patch 'applications/:id/approve' => 'applications#approve_applicant', as: :application_approve
  patch 'applications/:id/reject' => 'applications#reject_applicant', as: :application_reject
  resources :sessions, only: :index
  resources :applications
  resources :interviews
  resources :feedbacks
end
