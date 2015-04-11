Rails.application.routes.draw do
  root :to => 'static_pages#index', :via => :get

  get 'overview' => 'overview#index', :as => 'overview'
end
