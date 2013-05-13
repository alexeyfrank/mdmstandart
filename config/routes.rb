MdmStandart::Application.routes.draw do
  get "articles/index"

  get "articles/show"

  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: "welcome#index"

    resources :pages, only: [ :show ]
    resources :articles, only: [:index, :show]
    resource :session, only: [ :new, :create, :destroy ]
    resources :questions, only: [ :new, :create ]
    resources :contacts, only: [:index]
    resources :clients, only: [:index, :show]
    namespace :admin do
      root to: "welcome#index"

      resources :users
      resources :clients
      resources :pages
      resources :articles
      resources :questions
      resources :managers
    end
  end
end
