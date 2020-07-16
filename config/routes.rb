Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
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
    get '/excite-places' => 'spots#index_only_excite_places'
    resources :spot_comments
    resources :api_docs, only: [:index]
    resources :users, only: [:index, :show, :update]
    get '/user_spots_count_each_mood/:id' => 'users#user_spots_count_each_mood'
    get '/users/:id/profile-image' => 'users#show_profile_image'
    put '/users/:id/profile-image' => 'users#update_profile_image'
    scope :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end

  root 'static_pages#home'
end
