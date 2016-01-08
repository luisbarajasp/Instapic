Rails.application.routes.draw do

  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags

  devise_for :users

  resources :pictures do
      resources :comments, only: [:create,:destroy]
  end

  #root 'pictures#index'

  resources :users, only: [:show,:index]

  devise_scope :user do
      get "sign_out", :to => 'devise/sessions#destroy'
      get "sign_in", :to => "devise/sessions#new"
      authenticated :user do
        root :to => 'pictures#index', as: :authenticated_root
      end
      unauthenticated :user do
        root :to => 'devise/sessions#new', as: :unauthenticated_root
      end
    end

end
