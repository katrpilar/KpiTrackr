class CompanyKpi < ApplicationRecord
	belongs_to :company
	has_many :actual_metric_updates

	# serialize :actual, Array

	def current_actual
		if self.actual_metric_updates == []
			# binding.pry
			return 0
		else
			self.actual_metric_updates.last.metric
		end
	end
end
