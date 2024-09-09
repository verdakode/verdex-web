Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # get api routes
  post 'create-checkout-session', to: 'payments#create_checkout_session'

  # Serve frontend
  root 'application#frontend'
  get '*path', to: 'application#frontend', constraints: ->(request) { !request.xhr? && request.format.html? }

  get '/success', to: 'payments#success'
  get '/cancel', to: 'payments#cancel'

  # Defines the root path route ("/")
  # root "posts#index"
end
