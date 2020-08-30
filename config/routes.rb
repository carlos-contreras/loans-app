Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/api/ping', to: 'api#ping', as: 'api_ping'

  namespace :api do
    post 'authenticate', to: 'authentication#authenticate'
  end
end
