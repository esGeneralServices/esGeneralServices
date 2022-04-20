Rails.application.routes.draw do
  devise_for :trabalhadors, controllers: {
    sessions: 'trabalhadors/sessions',
    registrations: 'trabalhadors/registrations'
  }

  devise_scope :trabalhador do
    get '/trabalhadors/sign_out' => 'devise/sessions#destroy'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'
end
