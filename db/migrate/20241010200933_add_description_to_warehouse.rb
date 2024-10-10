class AddDescriptionToWarehouse < ActiveRecord::Migration[7.2]
  def change
    add_column :warehouses, :description, :string
  end
end
