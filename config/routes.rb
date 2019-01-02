Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/login", to: "sessions#new"
    get "/signup", to: "users#new"
  end
end
