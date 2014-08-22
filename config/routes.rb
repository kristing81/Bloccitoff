Blocitoff::Application.routes.draw do
  devise_for :users
  resources :todos, only: [:new, :create, :show, :index]


  root :to => "home#index"
end
