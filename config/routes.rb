Rails.application.routes.draw do
  root to: "homes#home"
  # get 'users/index'
  get 'home' => 'homes#home'
  get 'home/about' => "homes#about"
  devise_for :users
  
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
