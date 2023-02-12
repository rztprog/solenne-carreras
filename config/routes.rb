Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Root
  root to: "main#index"

  # Contact
  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get '/contacts/sent'

  # Photographies
  resources :photographies do
    resources :contents, only: [:new, :create, :destroy]
  end

  # Graphismes
  resources :graphismes
end
