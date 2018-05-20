class MetricsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_kpiable

	def new
		# @company = Company.find(params[:company_id])
		@kpi = Kpi.find(params[:kpi_id])
		@metric = Metric.new(kpi: @kpi)

		# @metric.company_kpi = Kpi.find((params[:kpi][:kpi_id]).to_i)
		# @metric.set_company = (params[:kpi][:kpi_id]).to_i)

		if params.has_key?(:company_id)
			@company = Company.find(params[:company_id])
		elsif params.has_key?(:team_id)
			@company = Team.find(params[:team_id]).company
		elsif params.has_key?(:member_id)
			@company = Member.find(params[:member_id]).team.company
		end
	end


	def create

		# @company = Company.find(params[:company_id])
		@kpi = Kpi.find(params[:kpi_id])
		# params.require(:metric).permit(:metric)
		@metric = Metric.new(params.require(:metric).permit(:metric, :kpi_id, :company_id, :kpiable))
		@metric.kpi = @kpi
		if params.has_key?(:company_id)
			@kpi.kpiable = Company.find(params[:company_id])
		elsif params.has_key?(:team_id)
			@kpi.kpiable = Team.find(params[:team_id])
		elsif params.has_key?(:member_id)
			@kpi.kpiable = Member.find(params[:member_id])
		end

		# binding.pry
		# Kpi.find(@met_comp)
		# binding.pry
		if @metric.save && params.has_key?(:company_id)
		 redirect_to company_path(@kpi.kpiable)
		 elsif @metric.save && params.has_key?(:team_id)
		 	redirect_to team_path(@kpi.team)
		elsif @metric.save && params.has_key?(:member_id)
			redirect_to member_path(@kpi.kpiable)
		end
	end

	def destroy
		@metric = Metric.find(params[:id]).destroy

		redirect_to company_path(current_user.company)
	end

	def set_kpiable
			# if params[:company_id] != nil
			# 	@kpiable = Company.find(params[:company_id])
			# end
			if params.has_key?(:company_id)
				@kpiable = Company.find(params[:company_id])
			elsif params.has_key?(:team_id)
				@kpiable = Team.find(params[:team_id])
			elsif params.has_key?(:member_id)
				@kpiable = Member.find(params[:member_id])
			end
	end
end


# params[:metric][:metric] = params[:metric][:metric].to_i
		# binding.pry
		# @kpi = Kpi.find(params[:metric][:kpi_id])
		# @metric.company_kpi = @kpi_id

		# @metric.company_kpi_id = params(:kpi[:kpi_id])