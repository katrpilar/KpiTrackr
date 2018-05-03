class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.string :name
      t.text :role
      t.integer :team_id
      t.timestamps
    end
  end
end
