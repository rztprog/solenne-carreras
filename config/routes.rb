Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Root
  root to: "main#index"

  # Unique
  delete 'photos/:id/purge/:photographie_id', to: 'photos#purge', as: 'purge_photo_contents'
  delete 'photos/:id/purge/:graphisme_id', to: 'photos#purge', as: 'purge_photo_elements'

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
end
