Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  resources :gruppettos do
    resources :participations, only: %i[create edit update destroy]
  end
  delete 'gruppettos/:gruppetto_id/participations/:id', to: 'participation#destroy', as: :participant

  resources :tracks, only: %i[new create]
end
