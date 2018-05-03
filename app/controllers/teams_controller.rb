class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = Team.new(params.require(:team).permit(:name, :description, :company_id))
		if @team.save
			redirect_to company_path(@team.company)
		end
	end
end
