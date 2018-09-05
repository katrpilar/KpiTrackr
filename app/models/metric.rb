class Metric < ApplicationRecord
	belongs_to :kpi

	def set_company(idnum)
		return idnum
	end

	validates :metric, presence: true
end
