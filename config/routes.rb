Rails.application.routes.draw do
  root 'home/top' => 'home#top'
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
