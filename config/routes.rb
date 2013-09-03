StoreEngine::Application.routes.draw do
  root to: 'store#index', via: :get
  resources :categories, only: [:show]
end
