Blocitoff::Application.routes.draw do
  devise_for :users

  resources :lists do
    resources :todos, except: [:index] do
       put :complete, on: :member
     end
  end


  get '/lists/:list_id/todos/:id' => 'lists#show'
  #put'/lists/:list_id/todo_complete' => 'lists#show' 
  match '/todos/complete' => 'todos#complete', :via => :post

  root to: "welcome#index"

end
  