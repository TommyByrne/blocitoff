Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:udate, :show, :index]
  root to: 'welcome#index'

  get 'about' => 'welcome#about'


end