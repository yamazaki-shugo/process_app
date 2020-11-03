Rails.application.routes.draw do
  get 'notices/index'
  devise_for :users
  root to: 'notices#index'
end
