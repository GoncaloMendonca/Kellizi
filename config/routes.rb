Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :insurance, only: [:show, :index] do
    resources :product, only: [:index] do
      resources :contract do
        resources :coverage, only: [:show, :index]
      end
    end
  end
  resources :users, only: [:show, :create, :update, :edit, :new ]
  resources :company, only: [:show, :index]
end
