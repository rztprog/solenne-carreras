Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "main#index"

  # Contact
  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get '/contacts/sent'

  # Photographies
  resources :photographies
    # Add upload multiplephotos to specific photographie context
end
