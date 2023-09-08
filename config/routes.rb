Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root to: "homes#top"
  get "homes/about" => "homes#about"

  # ユーザーサイド
  # namespace :public do
  #   resources :comments, only: [:create, :destroy, :edit, :update]
  #   resources :posts, only: [:index, :update, :destroy, :show, :new, :create]
  #   resources :likes, only: [:create, :index, :destroy]
  #   resources :users, only: [:show, :edit, :update]
  #   resources :registration, [:new, :create]
  #   resources :sessions, [:new, :create, :destroy]
  # end
  
  # アドミンサイド
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
