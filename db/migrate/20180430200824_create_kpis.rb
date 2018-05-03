class CreateKpis < ActiveRecord::Migration[5.1]
  def change
    create_table :kpis do |t|
      # t.string :daterange
      t.string :name
      t.string :unit
      # t.integer :actual
      t.integer :target
      t.date :target_start_date
      t.date :target_end_date
      t.integer :company_id
      t.references :kpiable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
