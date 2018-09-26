class Metric < ApplicationRecord
	belongs_to :kpi

	def set_company(idnum)
		return idnum
	end

	# def last_update
	# 	binding.pry
	# 	return kpi.current_actual
	# end
	validates :metric, presence: true
	validates :metric, :numericality => { :only_integer => true, :greater_than_or_equal_to => kpi_id }

	# def discount_cannot_be_greater_than_total_value
 #    if discount > total_value
 #      errors.add(:discount, "can't be greater than total value")
 #    end
 #  end

end
