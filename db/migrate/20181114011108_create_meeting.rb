class CreateMeeting < ActiveRecord::Migration[5.1]
  def change
    create_table :meetings do |t|
      t.string :overview
      t.integer :company_id
      t.date :date
      t.string :takeaways
      t.timestamps
    end
  end
end
