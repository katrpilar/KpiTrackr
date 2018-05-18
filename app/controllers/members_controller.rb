class MembersController < ApplicationController
	before_action :authenticate_user!

	def new
		@member = Member.new
	end


	def create
		@member = Member.new(params.require(:member).permit(:name, :role))
		@member.team = current_user.company.teams.first
		# binding.pry
	  if @member.save
	  	redirect_to company_path(@member.team.company)
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
