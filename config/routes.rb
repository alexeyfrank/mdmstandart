MdmStandart::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: "welcome#index"

    resources :pages, only: [ :show ]
    resource :session, only: [ :new, :create, :destroy ]
    resources :questions, only: [ :new, :create ]
    resources :contacts, only: [:index]
    resources :clients, only: [:index, :show]
    namespace :admin do
      root to: "welcome#index"

      resources :users
      resources :clients
      resources :pages
      resources :questions
      resources :managers
    end
  end
end
