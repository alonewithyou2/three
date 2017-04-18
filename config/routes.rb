Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  
  #the below meanssomeone makes a get request to contact new -get, we point them to the 
  #contacts controller and the new action -contacts#new'
  #get 'new', to: 'contacts#new'
  resources :contacts
end
