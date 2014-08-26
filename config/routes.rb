Blocitoff::Application.routes.draw do
  devise_for :users
  resources :todos, only: [:new, :create, :show, :index]

  resources :lists do
    resources :todos, only: [:new, :create, :show, :index]
  end

  root to: "welcome#index"
end
