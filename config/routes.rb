Rails.application.routes.draw do
    get 'pages/posts'
    get 'pages/about'
root 'posts#index', as: 'home'

get 'about' => 'pages#about', as: 'about'

resources :posts do
    resources :comments
end
end
