class KpisController < ApplicationController
	before_action :authenticate_user!
	# before_action :set_owner
	before_action :set_kpiable

	def index
		@kpis = Kpi.all
	end

	def show
		@kpi = Kpi.find(params[:id])
	end

	def new
		# binding.pry
		# User.first.company.kpis.create(name: "testing kpi")
		@kpi = Company.find(params[:company_id]).kpis.new
		# @kpi = Kpi.new
	end

	def create
		# binding.pry
		if params[:company_id] != nil
		end
		@kpi = Kpi.new(params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date, :kpi_id))

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

	# private
	# def set_owner
	# 	# @kpi_owner = params[params.keys.last]
	# 	if /company/.match(params.to_s) != nil
	# 		@kpi_owner = Company.find(params[:company_id])
	# 		return @kpi_owner
	# 	elsif /team/.match(params.to_s) != nil
	# 		@kpi_owner = Team.find(params[:team_id])
	# 		return @kpi_owner
	# 	elsif /member/.match(params.to_s) != nil
	# 		@kpi_owner = Member.find(params[:member_id])
	# 		return @kpi_owner
	# 	end
	# end

	private 
       def set_kpiable
       		if params[:company_id] != nil
       			@kpiable = Company.find(params[:company_id])
       		end
       end
end