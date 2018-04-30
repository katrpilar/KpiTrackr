class StaticPagesController < ApplicationController
	  before_action :authenticate_user!

	def home
		# binding.pry
	end

end
