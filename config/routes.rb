Rails.application.routes.draw do
  get 'tags/new'

  resources :tags

  root 'tags#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
