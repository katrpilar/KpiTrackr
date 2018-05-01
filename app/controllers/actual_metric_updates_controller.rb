class ActualMetricUpdatesController < ApplicationController
	def new
		@metric = ActualMetricUpdate.new
	end


	def create
		@metric = ActualMetricUpdate.new(params.require(:actual_metric_update).permit(:metric))
		params[:actual_metric_update][:metric] = params[:actual_metric_update][:metric].to_i
		binding.pry
		# @kpi = CompanyKpi.find(params[:actual_metric_update][:company_kpi_id])
		# @metric.company_kpi = @kpi_id

		# @metric.company_kpi_id = params(:company_kpi[:company_kpi_id])
		if @metric.save
		 redirect_to companies_path
		end
	end

	def destroy
		@metric = ActualMetricUpdate.find(params[:id]).destroy
	end
end
