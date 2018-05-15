class StaticPagesController < ApplicationController
	  before_action :authenticate_user!

	def home
		# binding.pry
		if user_signed_in? && Company.exists?(:user_id => current_user.id)
			@company = current_user.company
			redirect_to company_path(@company)
		end
	end

end
