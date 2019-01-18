Rails.application.routes.draw do
  resources :friend_requests
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/search", to: "users#search"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/service", to: "static_pages#service"
    get "/index", to: "static_pages#index"
    get "/friends", to: "users#friends"
    root "static_pages#home"
    resources :chatrooms do
      resource :chatroom_users
      resource :messages
    end
    resources :users
    resources :sessions
    resources :relationships
  end
end
