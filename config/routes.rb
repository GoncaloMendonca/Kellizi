Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'edit_profile', to: "devise/registrations#edit"
  end

  get 'my_profile', to: "pages#my_profile"
  get 'contact_us', to: "pages#contact_us"

  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :contracts
  get "dashboard", to: "pages#dashboard"
end
