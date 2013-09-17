StoreEngine::Application.routes.draw do
  root to: 'store#index', via: :get
  resources :categories, only: [:show]
  resources :cart_items, only: [:create, :destroy]
  resource :cart, only: [:show]
end
