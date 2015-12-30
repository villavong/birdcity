Rails.application.routes.draw do
  get 'beppupost/index'

  get 'students/index'

  devise_for :students
  root 'welcome#index'

  resources :students




  resources :beppuposts do
    resources :beppucomments
  end



end
