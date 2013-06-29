RpgRules::Application.routes.draw do
  root :to => "home#index"
  devise_for :users

  resources :rules
end
