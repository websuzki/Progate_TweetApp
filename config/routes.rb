Rails.application.routes.draw do
  get 'users/index'
  get 'login_form' => 'users#login_form'
  get 'logout' => 'users#logout'
  post 'users/login' => 'users#login'
  get 'users/:id/show' => 'users#show'
  get 'users/:id/edit' => 'users#edit'
  post 'users/:id/update' => 'users#update'
  get 'users/new' => 'users#new'
  post 'users/create' => 'users#create'
  root 'home#top'
  get 'posts/index' => 'posts#index'
  get 'posts/:id/show' => 'posts#show'
  get 'posts/new' => 'posts#new'
  post 'posts/create' => 'posts#create'
  post 'posts/:id/destroy' => 'posts#destroy'
  get 'posts/:id/edit' => 'posts#edit'
  post 'posts/:id/update' => 'posts#update'  
  
  get 'home/top' => 'home#top'
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
