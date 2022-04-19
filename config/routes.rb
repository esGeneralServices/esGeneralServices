Rails.application.routes.draw do
  devise_for :clientes, controllers: {
    sessions: 'clientes/sessions',
    registrations: 'clientes/registrations'
  }

  devise_scope :cliente do
    get '/clientes/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'
end
