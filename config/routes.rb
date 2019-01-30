Rails.application.routes.draw do

    resources :companies do
      resources :kpis, only: [:create, :new]
      resources :teams, only: [:create, :new]
      resources :meetings, only: [:create, :new]
    end

    resources :teams do
      resources :kpis, only: [:create, :new]
      resources :members, only: [:create, :new]
    end

    resources :kpis, only: [:edit, :update, :destroy] do
      resources :metrics, only: [:create, :new]
    end

    resources :meetings do
      resources :comments, only: [:create, :new, :index]
    end

    resources :metrics, only: [:edit, :update, :destroy]
    resources :comments, only: [:edit, :update, :destroy]

    resources :members, only: [:edit, :update, :destroy] do
      resources :kpis, only: [:create, :new]
    end

    get 'companymeetings', :to => 'meetings#all'

    resources :members, only: [:show]

  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', invitations: 'users/invitations' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  get '/ended', to: 'kpis#ended'

end
