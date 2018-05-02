class KpisController < ApplicationController
	before_action :authenticate_user!

	def index
		@kpis = Kpi.all
	end

	def show
		@kpi = Kpi.find(params[:id])
	end

	def new
		@kpi = Kpi.new
	end

	# def met
	# 	@metric = ActualMetricUpdate.new
	# end


	def create
		# @kpi = Kpi.new(params.require(:Kpi).permit(:type, :name, :unit, :actual, :target))
		@kpi = Kpi.new(params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date))
		@kpi.company = current_user.company
		# binding.pry
		if @kpi.save
		 # redirect_to company_kpi_path(@kpi)
		 redirect_to kpis_path
		end
	end

	def edit
		@kpi = Kpi.find(params[:id])
	end

	def update
		@kpi = Kpi.find(params[:id])
		@kpi.update(params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date))
		redirect_to action: 'index'
	end
end