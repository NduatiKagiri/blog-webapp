Rails.application.routes.draw do
  devise_for :users, path: ''
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
      delete 'logout', to: 'sessions#destroy'
    end
  end

  # Defines the root path route ("/")
  root "home#index"
end
