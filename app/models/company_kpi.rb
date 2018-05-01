class CompanyKpi < ApplicationRecord
	belongs_to :company
	has_many :actual_metric_updates

	# serialize :actual, Array

	def current_actual
		if self.actual_metric_updates == nil
			return 0
		else
			self.actual_metric_updates.last
		end
	end
end
