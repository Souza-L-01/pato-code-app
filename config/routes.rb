Rails.application.routes.draw do
  devise_for :users
  root to: "pages#landing"

  resources :languages, only: %i[index show] do
    resources :tracks, only: %i[show]
  end
  resources :lessons, only: %i[index show create] do
    # collection do
    #   get 'search'
    # end
    resources :posts, only: %i[index show create]
  end

  resources :posts, only: %i[destroy] do
    resources :comments, only: %i[create]
  end

  resources :comments, only: %i[destroy]

  resources :prompts, only: %i[new create show] do
    collection do
      post :generate_text
    end
  end
end
