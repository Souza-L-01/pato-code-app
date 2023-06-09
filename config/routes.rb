Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"

  resources :languages, only: %i[index show] do
    resources :tracks, only: %i[show]
  end
  resources :lessons, only: [:index, :show, :create] do
    collection do
      get 'search'
    end  
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