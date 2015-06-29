Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "static_pages/help"
  get "static_pages/about"

  get 'auth/facebook', as: "auth_provider"
  get 'auth/facebook/callback', to: 'users#login'

  namespace :admin do
    root "users#index"
    get "team_users/new"
    resources :users do
      resource :position_users, only: :show
      get "positions" => "position_users#show"
    end
    resources :teams do
      resource :team_users, only: :show
      get "members" => "team_users#show"
    end
    resources :imports
    resources :skills
    resources :projects
    resources :positions
  end
  resources :teams
  resources :users do
    resource :skill_users
    get "skills" => "skill_users#show"
  end
end
