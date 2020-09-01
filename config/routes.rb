Rails.application.routes.draw do
  root 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/api/ping', to: 'api#ping', as: 'api_ping'

  namespace :api do
    resource :authentication, only: :create
    resource :me, only: %i[show update], controller: 'me'
    resources :users, except: %i[new edit]
    resources :loans, except: %i[new edit]
    resources :payments, except: %i[new edit]
    resources :payment_updates, except: %i[new edit]
    resources :loan_updates, except: %i[new edit]
  end
end
