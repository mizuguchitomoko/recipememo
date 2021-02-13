Rails.application.routes.draw do
  devise_for :users
  root 'recipes#top'
  resources :recipes do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member # 追加
    get :followers, on: :member # 追加
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
