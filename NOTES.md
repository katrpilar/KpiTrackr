Need to add validations to models
	+Added validations to: Company, Kpi, Metric, Members

Company
	+Allow for Profile Photo
	Ability to preview profile photos

Metric
	Allow for a metric to be edited
	Allow for metric date to be changed (Would need to create migration)

Teams
	+Allow teams to have and create KPIs
	+Create Team pages
	Show kpis on the page
	Allow for teams to have objectives
	Allow Profile Photo


Comments
	Allow for comments on KPIs
	Comments belong to a user
	Add comments index feed to Company page

Add metric quality ratings
	Impact (1-5)

KPI
	+Change goal dates input to datepicker format
	Allow user to create collections/categories of KPIs
	Designate time duration: Quarterly, Monthly, Yearly
	Chart Avg needed trendline to show what's needed to meet the goal metric
	Tie to a goal
	Allow user to add a comment to the kpi when adding an update
	Add ability to star a kpi to make appear in the top section
	Add ability to create calculated metrics on New KPI page
		Select type => calculated 
			Select existing kpi metric from a drop down of all metrics created (seperated by company,team, indivdual)
				Toggl Options between: Goal_metric && Update (current_metric amount)

Users/Members
	Need to find a way to add members/users to a company (using invitable)
	Cannot view companies/kpis etc that they don't belong to
	Allow to add profile photo
	Allow for indivuals to have/create KPIs that can only be seen on their profile page

Goal
		Allow for MoM, YoY, etc goals that are tied to Kpis

UX/UI
	Make google Charts responsive