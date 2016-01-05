Rails.application.routes.draw do

  get 'users/index'

  get 'users/show'

  get "hashtags/:hashtag",   to: "hashtags#show",      as: :hashtag
  get "hashtags",            to: "hashtags#index",     as: :hashtags
  devise_for :users
  resources :pictures

  root 'pictures#index'

end
