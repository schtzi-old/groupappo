Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :gruppettos do
    resources :participations, only: %i[create edit update]
  end

  resources :tracks, only: %i[new create]
  resources :participations, only: [:destroy]
end
