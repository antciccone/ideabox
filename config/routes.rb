Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories, only: [:index, :show] do
    resources :ideas, only:  [:show, :edit, :update, :destroy]
  end

  resources :ideas, only: [:new, :create, :index]
  resources :images, only: [:index, :edit]
  resources :users

  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  delete  '/logout', to: 'sessions#destroy'

  namespace :admin do
    resources :categories
    resources :images
  end
end
