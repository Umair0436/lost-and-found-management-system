Rails.application.routes.draw do
  devise_for :users

  resources :items do
    resources :comments
  end

  root to: "items#index"
  # authenticated :user do
  #   root to: "items#index"
  # end

  # unauthenticated :user do
  #   root to: "devise/sessions#new"
  # end
end