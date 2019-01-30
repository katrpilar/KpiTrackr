class TeamsController < ApplicationController
	def new
		@team = Team.new
	end

	def create
		@team = Team.new(team_params)
		@company = current_user.company
		@team.company = @company
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
		if @team.update(team_params)
			redirect_to team_path(@team)
		else
			render :edit
		end
	end

	def destroy
		@team = Team.find(params[:id])
		@company = @team.company
		@team.destroy
		redirect_to (company_path(@company))
	end
	private
		def team_params
			params.require(:team).permit(:name, :description, :company_id, :team_pic)
		end
end
