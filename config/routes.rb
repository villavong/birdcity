Rails.application.routes.draw do
  get 'students/index'

  devise_for :students
  root 'students#index'

  resources :students

end
