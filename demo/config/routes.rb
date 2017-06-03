Rails.application.routes.draw do
    get '/login', to: 'logins#new'
    post '/login', to: 'logins#create'
    delete '/login', to: 'logins#destroy'
    resources :users do
        collection do
            get :allpost
        end
    end
    resources :announcements, :only=>[:index,:show]
    namespace :user do |user|
        resources :announcements
        resources :departments
    end
    #resources :login, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
