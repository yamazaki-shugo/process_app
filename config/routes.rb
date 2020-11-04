Rails.application.routes.draw do
  get 'notices/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'organizations', to: 'users/registrations#new_organization'
    post 'organizations', to: 'users/registrations#create_organization'
  end
  root to: 'rooms#index'
end
