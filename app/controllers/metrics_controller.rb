class MetricsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_kpiable

	def new
		@kpi = Kpi.find(params[:kpi_id])
		@metric = Metric.new(kpi: @kpi)
		@company = current_user.company

		# if params.has_key?(:company_id)
		# 	@company = Company.find(params[:company_id])
		# elsif params.has_key?(:team_id)
		# 	@company = Team.find(params[:team_id]).company
		# elsif params.has_key?(:member_id)
		# 	@company = Member.find(params[:member_id]).team.company
		# end
	end


	def create

		@kpi = Kpi.find(params[:kpi_id])
		@metric = Metric.new(metric_params)
		@metric.kpi = @kpi
		if @metric.valid?
			@metric.save
			case @kpi.kpiable_type
			when "Company"
				redirect_to company_path(@kpi.kpiable)
			when "Team"
				redirect_to team_path(@kpi.kpiable)
			when "Member"
				redirect_to member_path(@kpi.kpiable)
			else
				render :new
			end
		else
			render :new
		end
	end

	def destroy
		@metric = Metric.find(params[:id])
		@kpi = @metric.kpi
		@metric.destroy
		case @kpi.kpiable_type
		when "Company"
			redirect_to company_path(@kpi.kpiable)
		when "Team"
			redirect_to team_path(@kpi.kpiable)
		when "Member"
			redirect_to member_path(@kpi.kpiable)
		else
			redirect_to company_path(current_user.company)
		end

		# redirect_to company_path(current_user.company)
	end

	def set_kpiable
			if params.has_key?(:company_id)
				@kpiable = Company.find(params[:company_id])
			elsif params.has_key?(:team_id)
				@kpiable = Team.find(params[:team_id])
			elsif params.has_key?(:member_id)
				@kpiable = Member.find(params[:member_id])
			end
	end

	private

		def metric_params
			params.require(:metric).permit(:metric, :kpi_id, :company_id, :kpiable)
		end
end