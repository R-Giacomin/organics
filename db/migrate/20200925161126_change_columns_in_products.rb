class ChangeColumnsInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :price, :float
    change_column :products, :quantity, :integer
  end
end
