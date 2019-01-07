Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    get "/signup", to: "users#new"
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    get "/service", to: "static_pages#service"
    root "static_pages#home"
    resources :users, except: %i(destroy create)
  end
end
