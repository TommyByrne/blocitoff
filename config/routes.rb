Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:udate, :show, :index]

    resources :lists do
      resources :items
    end
  root to: 'welcome#index'

  get 'about' => 'welcome#about'


end