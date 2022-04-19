Rails.application.routes.draw do
  devise_for :trabalhadors, controllers: {
    sessions: 'trabalhadors/sessions',
    registrations: 'trabalhadors/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'welcome#index'
end
