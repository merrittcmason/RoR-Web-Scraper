Rails.application.routes.draw do
  get "pages/index"
  get "pages/show"
  get "pages/new"
  get "pages/edit"
  resources :pages do
    resources :checks, only: [:create]
  end

  root "pages#index"
end
