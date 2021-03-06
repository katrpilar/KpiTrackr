class Member < ApplicationRecord
  mount_uploader :picture, PictureUploader

	belongs_to :team
	has_many :kpis, as: :kpiable
	has_one :company, through: :team

	validates :name, presence: true
  validates :role, presence: true
end
