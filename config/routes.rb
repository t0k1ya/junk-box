Rails.application.routes.draw do
  root 'static_pages#index'
  
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    get '/:id', to: 'admins#show'
  end
  # 例外処理 TODO: コメアウト取り消す
  # get '*path', controller: 'application', action: 'render_404'
end
