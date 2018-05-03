class Company < ApplicationRecord
	# has_many :kpis
	belongs_to :user
	has_many :kpis, as: :kpiable
end
