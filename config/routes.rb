Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "main#index"

  resources :contacts, only: [:new, :create]
  get '/contacts', to: 'contacts#new', as: 'contact'
  get '/contacts/sent'
end
