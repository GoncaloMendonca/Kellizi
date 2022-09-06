Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'my_profile', to: "devise/registrations#edit"
  end

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :contracts
  get "dashboard", to: "pages#dashboard"
end
