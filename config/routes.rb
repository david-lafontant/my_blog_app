Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts, only: %i[new create] do
    resources :comments, only: %i[new create]
    resources :likes, only: %i[create destroy]
  end

  # Defines the root path route ("/")
  root "users#index"
end
