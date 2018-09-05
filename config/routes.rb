Rails.application.routes.draw do
  # companies
  # - kpis
  # - teams
  # kpis
  # - metrics
  # teams
  # - members
  # - kpis
  # members
  # - kpis

  # namespace :account do
    # must be logged in! uses current_user.id to find your resources
    resources :companies do
      # current_user can view their companies, create a company, edit one of their companies, etc.
      resources :kpis, only: [:create, :new] # Kpi.create(company_id)
      resources :teams, only: [:create, :new]
    end

    resources :teams do
      resources :kpis, only: [:create, :new]
      resources :members, only: [:create, :new]
    end

    resources :kpis, only: [:edit, :update, :destroy] do
      resources :metrics, only: [:create, :new]
    end

    resources :metrics, only: [:edit, :update, :destroy]

    resources :members, only: [:edit, :update, :destroy] do
      resources :kpis, only: [:create, :new]
    end
  # end

  


  # resources :members do
  #   resources :kpis do
  #     resources :metrics
  #   end
  # end

 

  # resources :teams do
  #   resources :kpis do
  #     resources :metrics
  #   end
  # end
#   resources :actual_metric_updates

	# scope path: ":company_kpi_id", as: "kpi" do
	#   resources :projects
	# end
  
	# map.resources :companies do |companies|
	# 	companies.resources :company_kpis, :name_prefix => "kpi_"
	# end

	# map.resources :company_kpis do |company_kpis|
	# 	company_kpis.resources :actual_metric_updates, :name_prefix => "add_"
	# end

  # resources :companies do
  # 	resources :kpis do
  #     resources :metrics
  #   end
  # end

  # resources :companies do
  #   resources :teams
  # end

  # resources :kpis do
  # 	resources :metrics
  # end

  # devise_for :users
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', invitations: 'users/invitations' }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

end
