Rails.application.routes.draw do




resources :contact_messages
resources :lessons

 get 'categories/index'
 get 'users/index'

root to: "homepage#index"
get 'contact_us', to: 'contact_messages#new'
get 'about_us', to: 'homepage#about_us'
get 'faq', to: 'homepage#faq'
get 'privacy_policy', to: 'homepage#privacy_policy'
get 'term_anc_conditions', to: 'homepage#term_anc_conditions'








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
