Rails.application.routes.draw do
  
  resources :interviews
  resources :openings do 
  	resources :employments 
  	
  end
  get 'employments', to: 'employments#get_list'
  root to: 'openings#index'
  get 'calender', to: 'visitors#index'
  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :users

  get 'employments/:id/schedule_interview' => 'employments#schedule_interview', as: :schedule
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
