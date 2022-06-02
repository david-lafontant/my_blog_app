Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: %i[index show] do
    resources :posts do
      resources :comments
      resources :likes
    end
  end

  # resources :posts, only: %i[new create] do
  #   resources :comments, only: %i[new create]
  #   resources :likes, only: %i[create destroy]
  # end

  # Defines the root path route ("/")
  root 'users#index'
end