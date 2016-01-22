Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  devise_for :students

  root 'students#index'

  authenticated :student do
    root to: "students#index", as: :authenticated_root
  end
  unauthenticated do
    root to: "students#index", as: :unauthenticated_root
  end

  resources :students do
    resources :studentcomments
  end




  resources :beppuposts do
    resources :beppucomments
  end


  resources :tokyoposts do
    resources :tokyocomments
  end


  resources :fukuokaposts do
    resources :fukuokacomments
  end

  resources :osakaposts do
    resources :osakacomments
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
  resources :chinaposts do
    resources :chinacomments
  end
  resources :vietposts do
    resources :vietcomments
  end
  resources :thaiposts do
    resources :thaicomments
  end


  get 'beppupost/index'

  get 'students/index'




end
