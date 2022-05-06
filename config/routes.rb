Rails.application.routes.draw do
  get 'test_sets/show'
  devise_for :users
  get 'welcome/index'
  root "welcome#index"

  match '/admin', to: redirect("/admin/exams"), via: :all
  namespace :admin do
    resources :exams, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create, :destroy]
    end
    resources :test_sets do
      resources :test_set_items, only: [:create, :update, :destroy]
    end
    resources :tests
  end

  resources :test_sets, only: [:show]
  resources :exams, only: [:show] do
    resources :entries, only: [:create]
    resources :tests, only: [:show] do
      resource :run, only: [:create], controller: :run
    end

    get :submissions, action: :create, controller: :submissions
    resources :submissions, only: [:new] do
      collection do
        get :cancel, action: :destroy
      end
    end
  end

  resources :answers, only: [:update] do
    resource :language, only: [:update], controller: :language
    resources :submissions, only: [:create]
  end

  resources :challenges, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
