Rails.application.routes.draw do
  root :to => 'overview#index', :via => :get
end
