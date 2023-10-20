Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }
  
  root to: "homes#top"
  get "homes/about" => "homes#about"
  get "search" => "searches#search"
  get "result" => "searches#result"
  # ユーザーサイド
  namespace :public do
    get "users/mypage" => "users#mypage"
    resources :posts, only: [:index, :update, :destroy, :show, :new, :create, :edit] do
      resources :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy, :edit, :update]
      delete "likes" => "likes#destroy"
    end
    resources :likes, only: [:create, :index, :destroy]
    resources :users, only: [:show, :edit, :update] do
      member do
        get :likes
        get :likes_post
      end
    end
    resources :groups do
      resources :group_users, only: [:create, :destroy]
    end
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
  end
  
  # アドミンサイド
  namespace :admin do
    resources :tags, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
