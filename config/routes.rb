Rails.application.routes.draw do
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
