Rails.application.routes.draw do

  devise_for :users
    resources :users, only: [:update, :show, :index, :edit]

    resources :lists do
      resources :items
    end

    root to: 'welcome#index'

    get 'about' => 'welcome#about'
end