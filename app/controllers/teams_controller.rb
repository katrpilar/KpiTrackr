class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = Team.new(params.require(:team).permit(:name, :description, :company_id))
		@company = current_user.company
		@team.company = @company
		# binding.pry

		if @team.valid?
			@team.save
			redirect_to company_path(@company)
		else
			render :new
		end
	end
end
