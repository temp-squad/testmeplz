Rails.application.routes.draw do
  get 'submissions/create'
  resources :exams, only: [:show] do
    resources :submissions, only: [:create]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
