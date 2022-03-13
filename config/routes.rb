Rails.application.routes.draw do
  get 'tests/show'
  get 'submissions/create'
  resources :exams, only: [:show] do
    resources :tests, only: [:show]
    resources :submissions, only: [:create]
  end
  resources :answers, only: [:update] do
    resources :submissions, only: [:create]
  end  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
