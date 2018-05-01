class CreateActualMetricUpdates < ActiveRecord::Migration[5.1]
  def change
    create_table :actual_metric_updates do |t|
      t.integer :metric
      t.integer :company_kpi_id
      t.timestamps
    end
  end
end
