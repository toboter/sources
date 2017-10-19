Rails.application.routes.draw do
  # added by nabu
  concern :commentable do
    resources :comments, only: [:index, :new, :create, :destroy]
  end
  # 'concerns: :commentable' needs to be added to any resource where nabu is included.
  resources :subjects, path: 'objects'
  resources :archives, controller: 'subjects', type: 'Archive', concerns: :commentable
  resources :collections, controller: 'subjects', type: 'Collection', concerns: :commentable
  resources :folders, controller: 'subjects', type: 'Folder', concerns: :commentable
  resources :letters, controller: 'subjects', type: 'Letter', concerns: :commentable
  resources :contracts, controller: 'subjects', type: 'Contract', concerns: :commentable

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :sources, only: [:index, :show] do
        collection do
          get 'search'
        end
      end  
    end
  end

  get '/api', to: 'home#api'
  get '/help', to: 'home#help'

  root 'home#index' 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
