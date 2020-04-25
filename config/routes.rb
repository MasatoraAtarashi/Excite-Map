Rails.application.routes.draw do
  get 'spots/index'
  get 'spots/new'
  get 'spots/create'
  get 'spots/update'
  get 'spots/destroy'
  root 'static_pages#home'
  namespace :api, {format: 'json'} do
    resources :spots
  end
end
