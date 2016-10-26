Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories do
    resources :ideas, only:  [:show]
  end

  resources :ideas, only: [:new, :create, :edit, :update, :destroy]
  resources :images
  resources :users, only: [:new, :create, :show]
end
