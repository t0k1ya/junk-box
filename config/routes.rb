Rails.application.routes.draw do
  get '/', action: :index, controller: 'static_pages'  
  
  resources :sessions, only: [:index, :show]
  namespace :admin do
    # resources :sessions
    get '/login', to: 'sessions#new'
  end
end
