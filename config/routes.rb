Rails.application.routes.draw do
  root 'static_pages#index'
  get '/search', to: 'static_pages#search'
  get '/article/:id', to: 'articles#show', as: :article

  get '/category/:name', to: 'categories#show',
    constraints: {name: /[^\/]+/}, as: :category

  get '/me', to: 'profiles#index'
  
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/:id', to: 'admins#show'
    
    resources :categories do
      collection do
      end
    end

    resources :articles do
      collection do
        post :draft
      end
    end
  end
  # NOTICE: develope環境以外のみ有効
  if Rails.env.production?
    get '*path', controller: 'application', action: 'render_404'
  end
end

