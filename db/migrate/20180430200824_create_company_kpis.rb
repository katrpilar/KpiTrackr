class CreateCompanyKpis < ActiveRecord::Migration[5.1]
  def change
    create_table :company_kpis do |t|
      t.string :daterange
      t.string :name
      t.string :unit
      t.integer :actual
      t.integer :target

      t.timestamps
    end
  end
end
