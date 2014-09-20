Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'},
                  constraints: {subdomain: 'api'}, path: '/' do
    namespace :v1 do
      resources :books
    end
  end
end
