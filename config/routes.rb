Rails.application.routes.draw do
  resources :bloggers
  resources :destinations
  resources :posts
  post 'post/:id/like', to: 'posts#like'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
