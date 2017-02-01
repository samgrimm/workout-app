Rails.application.routes.draw do
  
  devise_for :users
  get 'dashboards/index'

  root to: "dashboards#index"
  resources :users do
    resources :exercises
  end
end
