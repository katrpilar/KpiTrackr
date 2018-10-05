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
		@kpi = Kpi.new
		set_kpi_instance
	end

	def create
		#abstract out strong params to a private method
		@kpi = Kpi.new(kpi_params)
		if params.has_key?(:company_id)
			@kpi.kpiable = Company.find(params[:company_id])
		elsif params.has_key?(:team_id)
			@kpi.kpiable = Team.find(params[:team_id])
		elsif params.has_key?(:member_id)
			@kpi.kpiable = Member.find(params[:member_id])
		end

		if @kpi.valid?
			@kpi.save
			kpiable_routes
		else 
			render :new
		end
	end

	def edit
		@kpi = Kpi.find(params[:id])
	end

	def update
		@kpi = Kpi.find(params[:id])
		
		@company = current_user.company
		if @kpi.update(kpi_params)
			kpiable_routes
		else
			render :edit
		end
		# redirect_to company_path(@company)
	end

	def destroy
		@kpi = Kpi.find(params[:id])
		@kpi.destroy
		kpiable_routes
	end

	private 
   def set_kpiable
   		if params.has_key?(:company_id)
   			@kpiable = Company.find(params[:company_id])
   		elsif params.has_key?(:team_id)
   			@kpiable = Team.find(params[:team_id])
   		elsif params.has_key?(:member_id)
   			@kpiable = Member.find(params[:member_id])
   		end
   end

   def set_kpi_instance
   	if params.has_key?(:company_id)
			@company = Company.find(params[:company_id])
		elsif params.has_key?(:team_id)
			@company = Team.find(params[:team_id]).company
		elsif params.has_key?(:member_id)
			@company = Member.find(params[:member_id]).team.company
		end
   end

   def kpiable_routes
 		case @kpi.kpiable_type
		when "Company"				
			redirect_to company_path(current_user.company)
		when "Team"
			redirect_to team_path(Team.find(@kpi.kpiable_id))
		when "Member"
			redirect_to member_path(Member.find(@kpi.kpiable_id))
		else
			redirect_to :root_path
		end
   end 

   def kpi_params
   	params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date, :kpiable)
   end   
end