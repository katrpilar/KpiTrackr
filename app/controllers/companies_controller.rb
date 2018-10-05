class CompaniesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@company = Company.new
  end


  def create
  	@company = Company.new(company_params)
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
  		@kpis = @company.kpis
  	else
  		redirect_to '/'
  	end
  end

  def edit
  	@company = Company.find(params[:id])
  end

  def update
  	if Company.find(params[:id]).user == current_user
	    @company = Company.find(params[:id])
	    if @company.update(company_params)
	    	redirect_to company_path(@company)
	    else
	    	render :edit
	    end
    else
			redirect_to '/'
  	end
  end

  def destroy
  	@company = Company.find(params[:id])
  	@company.destroy
  	redirect_to :root_path
  end

  private
  	def company_params
  		params.require(:company).permit(:name, :avatar)
  	end
end
