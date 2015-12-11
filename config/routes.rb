Rails.application.routes.draw do

  get 'lesson_ratings/index'

  get 'lesson_ratings/new'

  get 'lesson_ratings/create'

  resources :contact_messages
  resources :lessons  do
    member do
      get :show_author
    end
  end
  get 'categories/index'
  get 'users/index'
  get 'users/show'
  get 'lessons/show_author',to: 'lessons#show_author'
  root to: "homepage#index"
  get 'contact_us', to: 'contact_messages#new'
  get 'about_us', to: 'homepage#about_us'
  get 'faq', to: 'homepage#faq'
  get 'privacy_policy', to: 'homepage#privacy_policy'
  get 'terms_and_conditions', to: 'homepage#terms_and_conditions'

 resources :lesson_ratings
  resources :comments
  resources :conversations do
    member do
      post :reply
      post :trash
      post :untrash
    end
    collection do
      get :trashbin
      post :empty_trash
    end
  end
  namespace :user do
    resources :lessons
    resources :users
    resources :messages do
      collection do
        get :received
        get :sent
      end
    end
  end
  namespace :admin do
    root to: "admin#index"
    resources :lessons do
      get "new_rating", on: :member
    end
    resources :categories
    resources :lesson_ratings
    resources :users
    resources :messages do
      collection do
        get :sent
        get :received
        get :talks
      end
    end
  end
  devise_for :users
end
