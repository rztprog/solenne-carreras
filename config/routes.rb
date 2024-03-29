Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'admin', 
    sign_out: 'logout',
    password: 'password',
    confirmation: 'verification',
    unlock: 'unlock', 
    registration: 'r',
    sign_up: 'sign_up' }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Root
  root to: "main#index"

  # Unique
  delete 'photos/:id/purge/photographies/:photographie_id', to: 'photos#purge_photographie', as: 'purge_photo_contents'
  delete 'photos/:id/purge/graphismes/:graphisme_id', to: 'photos#purge_graphisme', as: 'purge_photo_elements'

  delete 'photographies/:id/delete_all', to: 'photographies#delete_all', as: 'delete_all_photographies'
  delete 'graphismes/:id/delete_all', to: 'graphismes#delete_all', as: 'delete_all_graphismes'

  # Contact
  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get '/contacts/sent'

  # Photographies
  resources :photographies do
    resources :contents
  end

  # Graphismes
  resources :graphismes do
    resources :elements
  end

  # Retouches
  resources :retouches
end
