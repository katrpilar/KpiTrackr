class CompaniesController < ApplicationController
	  before_action :authenticate_user!

	  def new
	  	@company = Company.new
	  end


	  def create
	  	@company = Company.new(params.require(:company).permit(:name))
	  	@company.user = current_user

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

	  def update
	  	if Company.find(params[:id]).user == current_user
		    @company = Company.find(params[:id])
		    @company.update(params.require(:name))
		    redirect_to company_path(@company)
	    else
  			redirect_to '/'
	  	end
	  end

end
