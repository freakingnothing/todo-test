Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  
  namespace :v1 do
    root 'projects#index'
    
    resources :projects do
      resources :tasks
    end

    resources :tasks do
      resources :tasks
    end
  end
end
