Vocalgrader::Application.routes.draw do
  resources :trials
  resources :expected_waves, :actual_waves

  root to: 'pages#home'
  
  resources :users, :only => [:show, :destroy]
  post '/delete_user' => 'users#destroy_from_facebook'
  
  
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/auth/failure' => 'sessions#failure'
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/signin' => 'sessions#new', :as => :signin
  
end
