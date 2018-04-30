class Company < ApplicationRecord
	has_many :company_kpis
	belongs_to :user
end
