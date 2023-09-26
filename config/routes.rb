Rails.application.routes.draw do
  devise_for :users


  root "employees#index"
   resources :employees
   resources :companies

  get '/get_employees' => 'employees#get_employees'
end
