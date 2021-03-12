Rails.application.routes.draw do
  root 'static_pages#index'
  get '/search', to: 'static_pages#search'
  get '/article/:id', to: 'articles#show', as: :article

  resources :categories do
    collection do
    end
  end
  
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
  # 例外処理 TODO: コメアウト取り消す
  if !Rails.env.development?
    get '*path', controller: 'application', action: 'render_404'
  end
end

