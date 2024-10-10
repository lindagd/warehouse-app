class AddCepToWarehouse < ActiveRecord::Migration[7.2]
  def change
    add_column :warehouses, :cep, :string
  end
end
