Rails.application.routes.draw do
  # get 'rooms/new' => 'rooms#new'
  # get 'rooms/:id/edit' => 'rooms#edit'
  # post 'rooms/create' => 'rooms#create'
  # post 'rooms/:id/update' => 'rooms#update'
  resources :rooms
  post 'rooms/:id/edit' => 'rooms#edit'
  # delete 'rooms/:id/destroy' => 'rooms#destroy'
  devise_for :users
  root 'rooms#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
