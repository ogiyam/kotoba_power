Rails.application.routes.draw do
  devise_for :users
  
  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'
  resources :users, only: [:show]
  resources :groups, only: [:index, :new, :create, :destroy] 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end