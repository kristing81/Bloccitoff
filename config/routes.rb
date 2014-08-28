Blocitoff::Application.routes.draw do
  devise_for :users

  resources :lists do
    resources :todos, except: [:index]
  end

  root to: "lists#index"

end
