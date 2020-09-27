class ChangeColumnInOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :quantity, :float
  end
end
