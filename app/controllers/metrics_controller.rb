class MetricsController < ApplicationController
	def new
		@company = Company.find(params[:company_id])
		@kpi = Kpi.find(params[:kpi_id])
		@metric = Metric.new(kpi: @kpi)

		# @metric.company_kpi = Kpi.find((params[:kpi][:kpi_id]).to_i)
		# @metric.set_company = (params[:kpi][:kpi_id]).to_i)
	end


	def create

		@company = Company.find(params[:company_id])
		@kpi = Kpi.find(params[:kpi_id])
		# params.require(:metric).permit(:metric)
		@metric = Metric.new(params.require(:metric).permit(:metric, :kpi_id, :company_id))
		@metric.kpi = @kpi

		# binding.pry
		# Kpi.find(@met_comp)
		# binding.pry
		if @metric.save
		 redirect_to company_path(@company)
		end
	end

	def destroy
		@metric = Metric.find(params[:id]).destroy
	end
end


# params[:metric][:metric] = params[:metric][:metric].to_i
		# binding.pry
		# @kpi = Kpi.find(params[:metric][:kpi_id])
		# @metric.company_kpi = @kpi_id

		# @metric.company_kpi_id = params(:kpi[:kpi_id])