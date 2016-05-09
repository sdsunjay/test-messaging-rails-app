Rails.application.routes.draw do
  devise_for :users

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]

  resources :users, only: [:index]

  root to: 'conversations#index'
end
