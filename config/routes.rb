Rails.application.routes.draw do
  namespace :v1 do
    resources :projects do
      resources :tasks
    end
  end
end
