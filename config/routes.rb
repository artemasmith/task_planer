# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html
resources :plans
resources :tasks
resources :patterns
get '/departments', to: 'departments#index'
resources :departments