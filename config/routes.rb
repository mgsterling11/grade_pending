Rails.application.routes.draw do
  
  resources :cuisine_types
  resources :violation_descriptions
  resources :addresses
  resources :restaurants
  get '/' => 'welcome#index' 
  get '/search' => 'search#index'
  get '/search/multiple_results' => 'search#multiple_results'

  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  root :to => "users#new"
  resources :users
  resources :sessions
    
end
