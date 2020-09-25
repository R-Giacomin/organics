class AddCollumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :quantity, :integer
    add_column :orders, :price, :float
  end
end
