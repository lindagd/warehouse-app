require 'rails_helper'

RSpec.describe ProductModel, type: :model do
  describe '#valid?' do
    it 'name is mandatory' do
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA',
                            registration_number: '00897633220012', full_address: 'Av Nações Unidas, 12',
                            city: 'São Paulo', state: 'SP', zip: '18098-008', email: 'sac@samsung.com.br')

      pm = ProductModel.new(name: '', weight: 8000, width: 70, height: 45, depth: 10,
                            sku: 'TV32-SAMS-XPT090', supplier: supplier)

      result = pm.valid?

      expect(result).to eq false
    end
    it 'sku is mandatory' do
      supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA',
                            registration_number: '00897633220012', full_address: 'Av Nações Unidas, 12',
                            city: 'São Paulo', state: 'SP', zip: '18098-008', email: 'sac@samsung.com.br')

      pm = ProductModel.new(name: 'TV 32', weight: 8000, width: 70, height: 45, depth: 10,
                            sku: '', supplier: supplier)

      result = pm.valid?

      expect(result).to eq false
    end
  end
end
