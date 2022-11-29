Rails.application.routes.draw do
  get 'gruppettos/index'
  get 'gruppettos/show'
  get 'gruppettos/new'
  get 'gruppettos/create'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :gruppettos, only: %i[index show new create]
end
