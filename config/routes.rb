Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"

  resources :languages, only: %i[index show] do
    resources :tracks, only: %i[index show]
  end
  resources :lessons, only: [:index, :show, :create] do
    resources :posts, only: [:index, :show, :create]
  end
  resources :posts, only: [:delete] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:delete]

  resources :prompts, only: [:new, :create]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"
end
