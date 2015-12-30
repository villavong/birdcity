Rails.application.routes.draw do
  get 'students/index'

  devise_for :students
  root 'welcome#index'

  resources :students

end
