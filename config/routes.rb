Rails.application.routes.draw do
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

  resources :companies do
  	resources :kpis
  end

  resources :kpis do
  	resources :metrics
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'

end
