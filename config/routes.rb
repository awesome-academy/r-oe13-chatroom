Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/service", to: "static_pages#service"
    root "static_pages#home"
    resources :users, except: :destroy
    resources :chatrooms
  end
    resources :users
    resources :sessions
end
