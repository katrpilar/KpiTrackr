class Company < ApplicationRecord
	belongs_to :user
	has_many :teams
	has_many :kpis, as: :kpiable
	has_many :members, through: :teams

	validates :name, presence: true
end
