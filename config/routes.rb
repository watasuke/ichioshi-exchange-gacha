Rails.application.routes.draw do
  get 'results/create' => 'results#create'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  get 'posts/:slug' => 'posts#show'
  resources :posts, param: :slug

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'home#top'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
