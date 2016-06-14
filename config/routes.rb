Rails.application.routes.draw do
  resources :event_characters
  resources :events
  resources :guest_characters
  resources :guests
  resources :characters
  resources :evenings
  resources :games
  devise_for :hosts
  get 'index/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
