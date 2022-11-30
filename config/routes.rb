Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  require "sidekiq/web"
  authenticate :user, ->(user) { user.admin? } do
    mount Sidekiq::Web => '/sidekiq'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html


  resources :gruppettos do
    resources :participations, only: %i[create edit update destroy]
  end
  delete 'gruppettos/:gruppetto_id/participations/:id', to: 'participation#destroy', as: :participant

  resources :tracks, only: %i[new create]
end
