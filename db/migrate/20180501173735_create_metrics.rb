class CreateMetrics < ActiveRecord::Migration[5.1]
  def change
    create_table :metrics do |t|
      t.integer :metric
      t.integer :kpi_id
      t.timestamps
    end
  end
end
