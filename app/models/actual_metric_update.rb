class ActualMetricUpdate < ApplicationRecord
	belongs_to :company_kpi

	def set_company(idnum)
		return idnum
	end
end
