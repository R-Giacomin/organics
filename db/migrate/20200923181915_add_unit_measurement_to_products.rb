class AddUnitMeasurementToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :unit_measurement, :string
  end
end
