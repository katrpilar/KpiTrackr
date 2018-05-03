class Member < ApplicationRecord
	belongs_to :team, polymorphic: true
	belongs_to :company, polymorphic: true
	has_many :kpis, as: :kpiable 
end
