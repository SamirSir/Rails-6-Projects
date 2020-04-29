Rails.application.routes.draw do
  get 'favourite/update'
  get 'pythonfile', to: "contents#pythonfile", as: :pythonfile


  resources :gallaries
  resources :contents
  root to: 'contents#home'

  
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
