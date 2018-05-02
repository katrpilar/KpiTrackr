class Kpi < ApplicationRecord
	belongs_to :company
	has_many :metrics

	# serialize :actual, Array

	def current_actual
		if self.metrics == []
			# binding.pry
			return 0
		else
			self.metrics.last.metric
		end
	end
end
