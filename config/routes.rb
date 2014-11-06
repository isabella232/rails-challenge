Samplerb::Application.routes.draw do


  get "comments/create"

  get "comments/destroy"
  root :to => 'pictures#index'
  resources :pictures do 
    collection { get :search }
  end
  resources :comments, only: [:create, :destroy]


end
