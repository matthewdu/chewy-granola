Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :books

      match '/courses',         to: 'courses#index',  via: :get
      match '/courses/update',  to: 'courses#update', via: :post
    end
  end
end
