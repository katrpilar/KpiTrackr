class CompanyKpisController < ApplicationController
	before_action :authenticate_user!

	def index
		@kpis = CompanyKpi.all
	end

	def show
		@kpi = CompanyKpi.find(params[:id])
	end

	def new
		@kpi = CompanyKpi.new
	end


	def create
		# @kpi = CompanyKpi.new(params.require(:companykpi).permit(:type, :name, :unit, :actual, :target))
		@kpi = CompanyKpi.new(params.require(:company_kpi).permit(:daterange, :name, :unit, :actual, :target))
		@kpi.company = current_user.company
		# binding.pry
		if @kpi.save
		 # redirect_to company_kpi_path(@kpi)
		 redirect_to company_kpis_path
		end
	end

	def edit
		@kpi = CompanyKpi.find(params[:id])
	end

	def update
		@kpi = CompanyKpi.find(params[:id])
		@kpi.update(params.require(:company_kpi).permit(:daterange, :name, :unit, :actual, :target))
		redirect_to action: 'index'
	end
end