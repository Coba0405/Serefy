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

  # ユーザーサイド
  namespace :public do
    get "users/mypage" => "users#mypage"
    resources :comments, only: [:create, :destroy, :edit, :update]
    resources :posts, only: [:index, :update, :destroy, :show, :new, :create]
    resources :likes, only: [:create, :index, :destroy]
    resources :users, only: [:show, :edit, :update]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]

  end
  
  # アドミンサイド
  namespace :admin do
    resources :users, only: [:index, :edit, :update, :show]
    resources :genres, only: [:index, :create, :edit, :update]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
