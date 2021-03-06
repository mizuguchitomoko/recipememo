Rails.application.routes.draw do
  devise_for :users
  root 'recipes#top'
  resources :recipes do
    get :favorites, on: :member
    resource :favorites, only: [:create, :destroy]
    resources :recipe_comments, only: [:create, :destroy]
    resources :categories, only: [:show]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end

  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
  }
  namespace :admin do
    resources :categories, only: [:index, :create, :destroy, :edit, :update]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
