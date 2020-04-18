Rails.application.routes.draw do
    root to: 'toppages#index'
    
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    get 'signup', to: 'users#new'
    
    resources :users
    
    resources :schedules, only: [:index, :show, :new, :create, :edit, :update] do
        member do 
            put :reserve
            put :cancel 
        end
    end
    
    resource :password, only: [:show, :edit, :update]

    namespace :admin do 
        root "top#index"
        resources :schedules
    end
end
