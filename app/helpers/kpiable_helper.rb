module KpiableHelper

	def create_new
		
	end

	def find_all_kpis
		case controller_name
		when "Company"
			binding.pry
			all_kpis = @company.kpis.where("kpiable_type = ?", "Company")
			return all_kpis
		when "Team"
			all_kpis = @team.kpis.where("kpiable_type = ?", "Team")
			return all_kpis
		when "Member"
			all_kpis = @member.kpis.where("kpiable_type = ?", "Member")
			return all_kpis
		end
	end
end