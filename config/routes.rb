Blocitoff::Application.routes.draw do
  devise_for :users

  resources :lists do
    resources :todos, except: [:index] do
       put :complete, on: :member
     end
  end


  get '/lists/:list_id/todos/:id' => 'lists#show'
  get '/lists/:list_id/todos/:id' => 'todos#show'
  put'/lists/:list_id/todo_complete' => 'lists#show' 
  match '/todos/complete' => 'todos#complete', :via => :post
  delete '/lists/:id' => 'lists#destroy'
  root to: "welcome#index"

end
  