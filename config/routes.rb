Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Root
  root to: "main#index"

  # Unique
  delete 'photos/:id/purge/:photographie_id', to: 'photos#purge', as: 'purge_photo_contents'

  # Contact
  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get '/contacts/sent'

  # Photographies
  resources :photographies do
    resources :contents do
    end
  end

  # Graphismes
  resources :graphismes
end
