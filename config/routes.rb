RpgRules::Application.routes.draw do
  get "rules/index"

  root :to => "home#index"
  devise_for :users

  resources :rules
  resources :systems
end
