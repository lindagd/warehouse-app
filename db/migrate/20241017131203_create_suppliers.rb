class CreateSuppliers < ActiveRecord::Migration[7.2]
  def change
    create_table :suppliers do |t|
      t.string :corporate_name, null: false
      t.string :brand_name, null: false
      t.integer :registration_number, null: false
      t.string :full_address, null: false
      t.string :zip, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
