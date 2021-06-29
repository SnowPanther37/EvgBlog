Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
root 'posts#index', as: 'home' 
get 'sessions/new'
get 'signup'  => 'users#new'
get 'about' => 'pages#about', as: 'about'
get    'login'   => 'sessions#new'
post   'login'   => 'sessions#create'
get 'logout'  => 'sessions#destroy'
resources :posts do
    resources :comments
end
resources :users
resources :account_activations, only: [:edit]
resources :password_resets,     only: [:new, :create, :edit, :update]
end
