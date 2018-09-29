Rails.application.routes.draw do
  get 'agreements/create'
  get 'agreements/destroy'
  get 'wows/create'
  get 'wows/destroy'
  get 'users/collection' => 'users#collection'
  get 'users/posts' => 'users#posts'

  get 'results/create' => 'results#create'

  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:slug' => 'posts#show'
  get "posts/:slug/edit" => "posts#edit"
  post "posts/:slug/update" => "posts#update"
  post "posts/:slug/destroy" => "posts#destroy"
  resources :posts, param: :slug
  resources :posts do
    resources :wows, only: [:create, :destroy]
  end
  resources :posts do
    resources :agreements, only: [:create, :destroy]
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'home#top'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
