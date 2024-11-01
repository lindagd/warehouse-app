class Supplier < ApplicationRecord
  validates :corporate_name, :brand_name, :registration_number, :zip,
            :full_address, :city, :state, :email, presence: true
  validates :state, length: { is: 2 }
  
  has_many :product_models
end
