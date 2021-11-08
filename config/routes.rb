Rails.application.routes.draw do
  devise_for :users


  root to: 'homes#top'
  get '/about' => 'homes#about', as: 'about'


  resources :users, only: [:show]


  resources :groups, only: [:index, :show, :new, :create, :destroy] do
    get 'join' => 'groups#join'
    resources :group_words, only: [:index, :edit, :update, :show, :new, :create, :destroy] do
      resource :yes_opinions, only: [:create, :destroy]
      resource :no_opinions, only: [:create, :destroy]
      member do
        get 'result' => 'group_words#result'
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end