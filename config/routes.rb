Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'category/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  get 'category', to: "category#index"
  get 'category/new', to: "category#new"

  post 'category/new', to: "category#create"

  
  #get 'category/:id/edit', to: "category#edit"
  #put 'category/:id/update', to: "category#update"

  resources :category, only:[:update, :edit]

  root 'category#index'
end