class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.float :quantity
      t.integer :user_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
