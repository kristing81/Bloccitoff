Blocitoff::Application.routes.draw do
  get "welcome/index"
  devise_for :users
  resources :todos, only: [:new, :create, :show, :index]

  root to: "welcome#index"
end
