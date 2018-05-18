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
		# @kpi = Company.find(params[:company_id]).kpis.new
		@kpi = Kpi.new
		# @company = Company.find(params[:company_id])

		if params.has_key?(:company_id)
			@company = Company.find(params[:company_id])
		elsif params.has_key?(:team_id)
			@company = Team.find(params[:team_id]).company
		elsif params.has_key?(:member_id)
			@company = Member.find(params[:member_id]).team.company
		end

		# if params.has_key?(:company_id)
		# 	@company = Company.find(params[:company_id])
		# elsif params.has_key?(:team_id)
		# 	@team = Team.find(params[:team_id])
		# elsif params.has_key?(:member_id)
		# 	@member = Member.find(params[:member_id])
		# end
	end

	def create
		
		@kpi = Kpi.new(params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date, :kpiable))

		# binding.pry

		# params.keys.select{|key| key.to_s.match(/[a-zA-Z]+_id/)}
		# /[^(_id)]/.match(params[par[0]])

		# @kpiable = find_kpiable
		# @kpi = @kpiable.kpis.build(params[:kpi])


		if params.has_key?(:company_id)
			@kpi.kpiable = Company.find(params[:company_id])
		elsif params.has_key?(:team_id)
			@kpi.kpiable = Team.find(params[:team_id])
		elsif params.has_key?(:member_id)
			@kpi.kpiable = Member.find(params[:member_id])
		end

		# binding.pry
		if @kpi.save
		 # redirect_to company_kpi_path(@kpi)
		 redirect_to company_path(current_user.company)
		end
	end

	def edit
		@kpi = Kpi.find(params[:id])
	end

	def update
		@kpi = Kpi.find(params[:id])
		@kpi.update(params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date))
		@company = current_user.company
		redirect_to company_path(@company)
	end

	def destroy
		Kpi.find(params[:id]).destroy
		redirect_to company_path(current_user.company)
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

       # def find_kpiable
       #   params.each do |name, value|
       #     if name =~ /(.+)_id$/
       #       return $1.classify.constantize.find(value)
       #     end
       #   end
       #   nil
       # end
end