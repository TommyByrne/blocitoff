Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:update, :show, :index]

    resources :lists do
      resources :items, only: [:new, :create, :destroy]
    end

    root to: 'welcome#index'

    get 'about' => 'welcome#about'


end