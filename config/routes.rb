Rails.application.routes.draw do
  root to: 'recipes#index'
  namespace :admin do
    resources :users
    resources :recipes
    resources :admin_users

    root to: "users#index"
  end
  devise_for :users
  resources :recipes
end
