Rails.application.routes.draw do
  root 'pages#home'

  namespace :api, defaults: { format: :json } do
    resource :authentication, only: :create
    resource :me, only: %i[show update], controller: 'me'
    resources :users, except: %i[new edit]
    resources :loans, except: %i[new edit]
    resources :payments, except: %i[new edit]
    resources :payment_updates, except: %i[new edit]
    resources :loan_updates, except: %i[new edit]
  end
end
