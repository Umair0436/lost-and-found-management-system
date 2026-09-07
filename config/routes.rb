Rails.application.routes.draw do

  get "/items", to: "items#index"

  get "/items/new", to: "items#new", as: :new_item

  get "/items/:id/edit", to: "items#edit", as: :edit_item

  get "/items/:id", to: "items#show", as: :item

  post "/items", to: "items#create"

  patch "/items/:id", to: "items#update"

  delete "/items/:id", to: "items#destroy"

end