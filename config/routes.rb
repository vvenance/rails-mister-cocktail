Rails.application.routes.draw do
  resources :cocktails, only: [ :index, :new, :show, :create ] do
    resources :doses, only: [ :new, :create ]
  end
  resources :doses, only: [ :destroy ]

  root to: 'cocktails#index'

  mount Attachinary::Engine => "/attachinary"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
