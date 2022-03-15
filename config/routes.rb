Rails.application.routes.draw do
  match '/admin', to: redirect("/admin/exams"), via: :all
  namespace :admin do
    resources :exams, only: [:index, :show] do
      resources :comments, only: [:new, :create, :destroy]
    end
  end

  resources :exams, only: [:show] do
    resources :entries, only: [:create]
    resources :tests, only: [:show]

    get :submissions, action: :create, controller: :submissions
    resources :submissions, only: [:new] do
      collection do
        get :cancel, action: :destroy
      end
    end
  end
  resources :answers, only: [:update] do
    resources :submissions, only: [:create]
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
