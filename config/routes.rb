Rails.application.routes.draw do
  devise_for :users
  root to: "songs#index"

  resources :songs
  resource :search, only: :show
end
