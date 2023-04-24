class AddMaxWindSpeedAndDirection < ActiveRecord::Migration[7.0]
  def change
    add_column :measurements, :max_wind_speed, :float
    add_column :measurements, :max_wind_direction, :float
  end
end
