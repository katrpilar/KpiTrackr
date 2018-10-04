class Kpi < ApplicationRecord
	include ActionView::Helpers::DateHelper
	# belongs_to :user
	# belongs_to :company, polymorphic: true
	# belongs_to :team, polymorphic: true
	belongs_to :kpiable, polymorphic: true
	has_many :metrics
	validates :name, presence: true
  validates :target, presence: true
  validates :target, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 }
  validates :target_start_date, presence: true
  validates :target_end_date, presence: true

  def self.ended
   where("target_end_date < ?", Time.now)
  end

	def current_actual
		# binding.pry
		if self.metrics === [] || self.metrics === nil
			# binding.pry
			return 0
		else
			self.metrics.last.metric
		end
	end
end
