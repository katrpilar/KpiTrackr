class Member < ApplicationRecord
	belongs_to :team
	has_many :kpis, as: :kpiable
end
