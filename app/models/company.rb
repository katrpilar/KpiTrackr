class Company < ApplicationRecord
	has_many :kpis
	belongs_to :user
end
