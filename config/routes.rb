FileShare::Application.routes.draw do
  resources :uploads, only: [:new, :create]
end
