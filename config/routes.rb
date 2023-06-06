Rails.application.routes.draw do
  get 'chats/index'
  get 'ducks/show'
  get 'prompts/new'
  get 'prompts/create'
  get 'comments/create'
  get 'comments/destroy'
  get 'discussions/index'
  get 'discussions/new'
  get 'discussions/create'
  get 'discussions/show'
  get 'lessons/index'
  get 'lessons/show'
  get 'users/new'
  get 'users/create'
  get 'tracks/index'
  get 'tracks/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
