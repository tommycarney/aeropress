Rails.application.routes.draw do
  namespace :admin do
    resources :users
    resources :recipes
    resources :admin_users

    root to: "users#index"
  end

  devise_for :users
  root to: 'recipes#index'
  resources :recipes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
