Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get 'home/about'
  resources :users, only: [:show, :index, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'relationships/followings_index' => 'relationships#followings_index'
    get 'relationships/followers_index' => 'relationships#followers_index'
  end
  resources :books, except: [:new] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
end
