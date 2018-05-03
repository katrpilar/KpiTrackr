class CompaniesController < ApplicationController
	  before_action :authenticate_user!

	  def new
	  	@company = Company.new
	  end


	  def create
	  	@company = Company.new(params.require(:company).permit(:name))
	  	@company.user = current_user
	  	# binding.pry
	    @company.save
	    redirect_to company_path(@company)
	  end

	  def show
	  	@company, @kpiable = Company.find(params[:id])
	  end

	  def update
	    @company = Company.find(params[:id])
	    @company.update(params.require(:name))
	    redirect_to company_path(@company)
	  end

end
