class Kpi < ApplicationRecord
	# belongs_to :user
	# belongs_to :company, polymorphic: true
	# belongs_to :team, polymorphic: true
	belongs_to :kpiable, polymorphic: true
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
