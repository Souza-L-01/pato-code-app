Rails.application.routes.draw do
  root to: "pages#landing"
    get '/home', to: 'pages#home'
    devise_for :users
    resources :tracks, only: [:index, :show]

  resources :lessons, only: [:show] do
    resources :posts, only: [:index, :show, :create]
  end
  resources :posts, only: [:destroy] do
    resources :comments, only: [:create]
  end

  resources :comments, only: [:destroy]

  # resources :prompts, only: [ :generate_text ]

  resources :prompts, only: [:new, :create] do
    collection do 
      get :generate_text
      post :generate_text
    end
  end

end