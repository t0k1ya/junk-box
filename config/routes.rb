Rails.application.routes.draw do
  get '/', action: :index, controller: 'static_pages'  
end
