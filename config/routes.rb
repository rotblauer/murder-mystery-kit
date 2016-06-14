Rails.application.routes.draw do
  root 'index#home'
  devise_for :hosts

  resources :event_characters
  resources :events
  resources :guest_characters
  resources :guests
  resources :characters
  resources :evenings
  resources :games
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
