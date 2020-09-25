class AddUnitMeasurementToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :unit_measurement, :string
  end
end
