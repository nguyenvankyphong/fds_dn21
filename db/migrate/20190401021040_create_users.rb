class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role, null: false, default: 0
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
