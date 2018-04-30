class CompanyKpisController < ApplicationController
	before_action :authenticate_user!

	def index
		@kpis = CompanyKpi.all
	end

	def new
		@kpi = CompanyKpi.new
	end


	def create
		# @kpi = CompanyKpi.new(params.require(:companykpi).permit(:type, :name, :unit, :actual, :target))
		@kpi = CompanyKpi.new(params.require(:company_kpi).permit(:daterange, :name, :unit, :actual, :target))
		@kpi.save
		render action: 'index'
	end

	def edit
		@kpi = CompanyKpi.find(params[:id])
	end

	def update
		@kpi = CompanyKpi.find(params[:id])
		@kpi.update(params.require(:company_kpi).permit(:daterange, :name, :unit, :actual, :target))
		render action: 'index'
	end
end