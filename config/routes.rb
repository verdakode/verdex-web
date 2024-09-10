Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Set root path to serve index.html
  root 'home#index'

  # get api routes
  post 'create-checkout-session', to: 'payments#create_checkout_session'
  get '/success', to: 'payments#success'
  get '/cancel', to: 'payments#cancel'
  get '/test_render', to: 'payments#test_render'

 # Defines the root path route ("/")
  # root "posts#index"
end
