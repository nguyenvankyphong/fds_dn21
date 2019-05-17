class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :category_id
      t.string :information
      t.integer :price, default: 0
      t.string :image_path
      t.integer :quantity, default: 0
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
