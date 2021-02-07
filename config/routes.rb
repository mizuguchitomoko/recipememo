Rails.application.routes.draw do
  devise_for :users
  root 'recipes#top'
  resources :recipes
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
