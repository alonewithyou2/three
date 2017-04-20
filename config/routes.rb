Rails.application.routes.draw do
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  
  #the below meanssomeone makes a get request to contact new -get, we point them to the 
  #contacts controller and the new action -contacts#new'
  #get 'new', to: 'contacts#new'

  #added the below because resources then any object, such as :contacts, then it expands into
  #8 different routes as seen when yuo type in 'rails routes', RESTful routes
  #
  resources :contacts
  get 'contact-us', to:'contacts#new'
end
