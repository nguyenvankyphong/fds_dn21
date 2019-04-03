class RemoveImagePathFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image_path, :string
  end
end
