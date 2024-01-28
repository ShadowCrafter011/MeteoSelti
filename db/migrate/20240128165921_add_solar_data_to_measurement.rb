class AddSolarDataToMeasurement < ActiveRecord::Migration[7.0]
  def change
    add_column :measurements, :load, :float
    add_column :measurements, :grid, :float
    add_column :measurements, :pv, :float
  end
end
