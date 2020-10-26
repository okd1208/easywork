Rails.application.routes.draw do
  get 'statuses/create'
  get 'statuses/destroy'
  get 'privatetasks/create'
  get 'privatetasks/destroy'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  
  get 'toppages/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  get "users/:id/fin_task" => "users#fin_task"
  get "users/:id/unfin_task" => "users#unfin_task"
  resources :users, only: [:index, :show, :new, :create]
  resources :privatetasks, onry: [:create, :destroy, :edit, :show]
  post "privatetasks/:id/progres" => "privatetasks#progres"
  post "privatetasks/:id/unprogres" => "privatetasks#unprogres"
  get "privatetasks/:id/edit" => "privatetasks#edit"
  get "privatetasks/:user_id/:category" => "privatetasks#category"
  post "privatetasks/:user_id/all_destroy" => "privatetasks#all_destroy"
  post "privatetasks/:id/create_category" => "privatetasks#create_category"
  resources :statuses, only: [:new, :create, :destroy]
end
