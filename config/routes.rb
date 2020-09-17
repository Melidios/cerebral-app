Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  delete '/logout' => 'sessions#destroy'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'

  root to: 'sessions#page_requires_login'

  post 'pay/:user_id', to: 'payments#pay', as: 'pay'
  post 'cancel/:user_id', to: 'payments#cancel', as: 'cancel'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
