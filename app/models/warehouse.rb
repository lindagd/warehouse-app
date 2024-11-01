class Warehouse < ApplicationRecord
  validates :name, :code, :description, :area,
            :address, :cep, :city, presence: true
  validates :code, length: { is: 3 }, uniqueness: true

  def full_description
    "#{code} - #{name}"
  end
end
