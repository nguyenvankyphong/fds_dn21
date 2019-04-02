class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :status
      t.integer :user_id
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
