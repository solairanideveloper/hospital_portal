Rails.application.routes.draw do
  get    'login',  to: 'sessions#new'
  post   'login',  to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  devise_for :users

  root 'sessions#new'

  resources :patients
  resources :appointments, only: [:index, :new, :create]
  
  # Receptionist and Doctor dashboards
  get 'receptionist_dashboard', to: 'patients#index', as: 'receptionist_dashboard'
  get 'doctor/patient_chart', to: 'doctors#patient_chart', as: 'doctor_patient_chart'
  get 'doctor/dashboard', to: 'doctors#index', as: 'doctor_dashboard'
end



