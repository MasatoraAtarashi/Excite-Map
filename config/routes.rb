Rails.application.routes.draw do
  get 'spot_comments/show'
  get 'spot_comments/new'
  get 'spot_comments/create'
  get 'spot_comments/update'
  get 'spot_comments/destroy'
  get '/admin' => 'spots#index', as: 'admin'
  
  devise_for :users
  resources :spots

  devise_scope :user do
    get '/users/sign_out' => 'users/sessions#destroy'
    get '/users/:id' => 'users/registrations#show', as: 'user'
    get '/users' => 'users#index', as: 'users_index'
    delete '/users/:id' => 'users#destroy'
  end

  namespace :api, {format: 'json'} do
    resources :spots
    resources :spot_comments
    resources :api_docs, only: [:index]
  end

  root 'static_pages#home'
end
