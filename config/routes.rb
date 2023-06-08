Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
g
  resources :languages, only: %i[index show] do
    resources :tracks, only: %i[index show]
  end
  resources :lessons, only: [:show] do
    resources :posts, only: %i[index show create]
  end
  resources :posts, only: [:delete] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:delete]

  resources :prompts, only: %i[show new create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
end
