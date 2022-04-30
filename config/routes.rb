Rails.application.routes.draw do

  devise_for :clientes, controllers: {
    sessions: 'clientes/sessions',
    registrations: 'clientes/registrations'
  }

  devise_scope :cliente do
    get '/clientes/sign_out' => 'devise/sessions#destroy'
  end

  get 'clientes/index'
  get 'clientes/show'
  get 'clientes/delete'
  resources :clientes

  devise_for :trabalhadors, controllers: {
    sessions: 'trabalhadors/sessions',
    registrations: 'trabalhadors/registrations'
  }

  devise_scope :trabalhador do
    get '/trabalhadors/sign_out' => 'devise/sessions#destroy'
  end

  get 'trabalhadors/index'
  get 'trabalhadors/show'
  get 'trabalhadors/delete'
  resources :trabalhadors do
    resources only: [:ListagemServicos]
    get 'listagem' => 'servicos#ListagemServicos'
  end
  resources :servicos

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  devise_scope :admin do
    get '/admins/sign_out' => 'devise/sessions#destroy'
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'
end
