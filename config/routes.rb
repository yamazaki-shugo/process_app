Rails.application.routes.draw do
  get 'diaries/index'
  get 'events/index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'organizations', to: 'users/registrations#new_organization'
    post 'organizations', to: 'users/registrations#create_organization'
  end

  root to: 'rooms#index'
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:index, :new, :create, :update] do
      get 'asign', on: :member
      get 'search', on: :collection
    resources :notices, only: [:index, :new, :create]
    resources :events
    resources :diaries
  end
end
