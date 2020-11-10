Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'organizations', to: 'users/registrations#new_organization'
    post 'organizations', to: 'users/registrations#create_organization'
  end
  root to: 'rooms#index'
  resources :rooms, only: [:index, :new, :create, :update] do
    member do 
      get 'asign'
    end
    resources :notices, only: [:index, :create]
  end
end
