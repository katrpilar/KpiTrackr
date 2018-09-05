class MembersController < ApplicationController
	before_action :authenticate_user!

	def new
		# binding.pry
		@member = Member.new
		if !@member.team_id
			@team = Team.find(params[:team_id]) unless @member.team
		else 
			@team = Team.find(@member.team_id)
		end
		# @team = params[:team]
		# binding.pry
	end


	def create
		@member = Member.new(params.require(:member).permit(:name, :role))
		# binding.pry
		@member.team = Team.find(params[:team_id])
		@team = @member.team
		# binding.pry
	  if @member.valid?
	  	@member.save
	  	redirect_to company_path(current_user.company)
	  else
	  	render :new
	  	# render new_team_member_path(@team)
	  	# render new_team_member_path(@team).to_s
	  end
	end

	def show
		@member = Member.find(params[:id])
		@team = @member.team
		# if @member.kpis.exists?
		# 	@kpis = @member.kpis
		# end
	end

	def update
	  @member = Member.find(params[:id])
	  @member.update(params.require(:member).permit(:name, :role))
	  redirect_to company_path(@member.company)
	end

	def destroy
		Member.find(params[:id]).destroy
		redirect_to company_path(current_user.company)
	end
end
