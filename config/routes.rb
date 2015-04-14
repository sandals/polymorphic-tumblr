Rails.application.routes.draw do
  root :to => 'static_pages#index', :via => :get

  get 'overview' => 'overview#index', :as => 'overview'
  get 'profile/:id' => 'profile#show', :as => 'profile'

  resources :posts, :only => [:destroy]
  resources :text_posts, :only => [:new, :create]
  resources :image_posts, :only => [:new, :create]
end
