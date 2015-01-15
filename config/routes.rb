Rails.application.routes.draw do

  get 'items/create'

  devise_for :users
    resources :users, only: [:udate, :show, :index]

    resources :lists do
      resources :items, only: [:create]
    end
  root to: 'welcome#index'

  get 'about' => 'welcome#about'


end