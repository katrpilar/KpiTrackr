class Team < ApplicationRecord
	mount_uploader :team_pic, TeamPicUploader
	belongs_to :company
	# belongs_to :member
	has_many :members
	has_many :kpis, as: :kpiable
	validates :name, presence: true
end
