Rails.application.routes.draw do
  get 'posts/show' => 'posts#show'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'home#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
