Rails.application.routes.draw do
  devise_for :hosts
  get 'index/home'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
