class ChangeRegistrationNumberToBeStringInSuppliers < ActiveRecord::Migration[7.2]
  def change
    change_column :suppliers, :registration_number, :string
  end
end
