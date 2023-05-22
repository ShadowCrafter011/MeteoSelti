class AddCloudStatusToMeasurement < ActiveRecord::Migration[7.0]
  def change
    add_column :measurements, :cloud_status, :string
    add_column :measurements, :cloud_status_certainty, :float
  end
end
