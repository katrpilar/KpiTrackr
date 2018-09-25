class AddTeamPicToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :team_pic, :string
  end
end
