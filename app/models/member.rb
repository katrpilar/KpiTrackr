class Member < ApplicationRecord
	belongs_to :team
	has_many :kpis, as: :kpiable

	validates :name, presence: true
  validates :role, presence: true
end
