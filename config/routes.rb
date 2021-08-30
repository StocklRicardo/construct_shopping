Rails.application.routes.draw do
 
  
  post '/rate' => 'rater#create', :as => 'rate'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'category#index'

  patch 'ads/edit', to: 'ads#edit'
    resources :category
    resources :ads
    devise_for :users

end