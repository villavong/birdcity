Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :students, controllers: { registrations: "registrations"}
    root 'welcome#index'

  resources :students




  resources :beppuposts do
    resources :beppucomments
  end

  resources :eastposts do
      resources :eastcomments
    end

  resources :southposts do
    resources :southcomments
  end

  resources :otherposts do
    resources :othercomments
  end

  get 'beppupost/index'

  get 'students/index'




end
