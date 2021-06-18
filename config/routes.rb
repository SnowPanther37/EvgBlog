Rails.application.routes.draw do
root 'posts#index', as: 'home'
get 'signup'  => 'users#new'
get 'about' => 'pages#about', as: 'about'

resources :posts do
    resources :comments
end
end
