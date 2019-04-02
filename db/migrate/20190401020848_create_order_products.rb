class CreateOrderProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :order_products do |t|
      t.integer :product_id
      t.integer :quantity
      t.integer :price
      t.integer :order_id
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
