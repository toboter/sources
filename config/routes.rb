Rails.application.routes.draw do
  # added by nabu
  concern :commentable do
    resources :comments, only: [:index, :new, :create, :destroy]
  end
  # 'concerns: :commentable' needs to be added to any resource where nabu is included.
  resources :subjects, path: 'objects', concerns: :commentable
  resources :archives, controller: 'subjects', type: 'Archive' 
  resources :collections, controller: 'subjects', type: 'Collection' 
  resources :folders, controller: 'subjects', type: 'Folder'
  resources :letters, controller: 'subjects', type: 'Letter'

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      # resources :subjects, path: 'objects', only: [:index, :show] do
      #   get 'search', on: :collection
      #   get "file", to: "commons#view_file", on: :member
      # end  
    end
  end

  get '/api', to: 'home#api'
  get '/help', to: 'home#help'

  root 'home#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
