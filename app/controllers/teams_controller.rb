class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = Team.new(params.require(:team).permit(:name, :description, :company_id, :team_pic))
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

	def show
		@team = Team.find(params[:id])
		@kpis = @team.kpis
	end

	def edit
		@team = Team.find(params[:id])
	end

	def update
		@team = Team.find(params[:id])
		@team.update(params.require(:team).permit(:name, :description, :company_id, :team_pic))
		binding.pry
		redirect_to company_path(current_user.company)
	end

	def destroy
		Team.find(params[:id]).destroy
		redirect_to (company_path(current_user.company))
	end
end
