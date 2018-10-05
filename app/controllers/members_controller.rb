class MembersController < ApplicationController
	before_action :authenticate_user!

	def new
		@member = Member.new #(team_id: params[:team_id])
		# binding.pry
		if !@member.team_id
			@team = Team.find(params[:team_id]) unless @member.team
		else 
			@team = Team.find(@member.team_id)
		end
	end

	def create
		@member = Member.new(member_params)
		# binding.pry
		@member.team = Team.find(params[:team_id])
		@team = @member.team
		# binding.pry
	  if @member.valid?
	  	@member.save
	  	redirect_to company_path(current_user.company)
	  else
	  	render :new
	  end
	end

	def show
		@member = Member.find(params[:id])
		@team = @member.team
		@kpis = @member.kpis
	end

	def edit
		# binding.pry
		@member = Member.find(params[:id])
		@team = @member.team
	end

	def update
	  @member = Member.find(params[:id])
	  @team = @member.team
	  if @member.update(member_params)
	  	redirect_to company_path(@team.company)
	  else
	  	render :edit
	  end
	end

	def destroy
		Member.find(params[:id]).destroy
		redirect_to company_path(current_user.company)
	end

	private
		def member_params
			params.require(:member).permit(:name, :role, :picture)
		end
end
