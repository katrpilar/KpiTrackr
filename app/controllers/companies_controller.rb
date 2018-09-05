class CompaniesController < ApplicationController
	  before_action :authenticate_user!

	  def new
	  	@company = Company.new
	  end


	  def create
	  	@company = Company.new(params.require(:company).permit(:name, :avatar))
	  	@company.user = current_user
	  	# @company.avatar = params[:avatar]
	  	if @company.valid?
				@company.save
	    	redirect_to company_path(@company)
	    else
	    	render new_company_path
	    end
	  end

	  def show
	  	if Company.find(params[:id]).user == current_user
	  		@company = Company.find(params[:id])
	  	else
	  		redirect_to '/'
	  	end
	  	# @company, @kpiable = Company.find(params[:id])
	  end

	  def edit
	  	@company = Company.find(params[:id])
	  end

	  def update
	  	if Company.find(params[:id]).user == current_user
		    @company = Company.find(params[:id])
		    if @company.update(params.require(:company).permit(:name, :avatar))
		    	redirect_to company_path(@company)
		    else
		    	render :edit
		    end
	    else
  			redirect_to '/'
	  	end
	  end

	  def destroy
	  end


	#   def edit
	# 	@kpi = Kpi.find(params[:id])
	# end

	# def update
	# 	@kpi = Kpi.find(params[:id])
	# 	@kpi.update(params.require(:kpi).permit(:name, :unit, :target, :target_start_date, :target_end_date))
	# 	@company = current_user.company
	# 	redirect_to company_path(@company)
	# end

	# def destroy
	# 	Kpi.find(params[:id]).destroy
	# 	redirect_to company_path(current_user.company)
	# end
end
