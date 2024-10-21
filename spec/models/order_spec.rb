require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it 'must have a code' do
      user = User.create!(name: 'Linda', email: 'linda@email.com', password: 'senha123')
      warehouse = Warehouse.create!(name: 'Rio de Janeiro', code: 'RIO', city: 'Rio de Janeiro', area: 32_000,
                        address: 'Avenida Copacabana, 202', cep: '32100-000',
                        description: 'Galpão da zona portuária do Rio')
      supplier = Supplier.create!(brand_name: 'Coca-Cola', corporate_name: 'Coca-Cola Indústrias LTDA',
                      registration_number: '00409096000146', full_address: 'Av. Zumbi dos Palmares, 4945',
                      city: 'Rio de Janeiro', state: 'RJ', zip: '32150-090', email: 'distribuidora@cocacola.com.br')
      order = Order.new(user: user, warehouse: warehouse,
                supplier: supplier, estimated_delivery_date: '2024-10-25')

      result = order.valid?

      expect(result).to be true
    end

    it 'must have an estimated delivery date' do
      order = Order.new(estimated_delivery_date: '')

      order.valid?

      expect(order.errors.include? :estimated_delivery_date).to be true
    end

    it 'estimated delivery date must be future date' do
      order = Order.new(estimated_delivery_date: 1.day.ago)

      order.valid?

      expect(order.errors.include? :estimated_delivery_date).to be true
    end
  end

  describe 'generates random code' do
    it 'when creating new order' do
      user = User.create!(name: 'Linda', email: 'linda@email.com', password: 'senha123')
      warehouse = Warehouse.create!(name: 'Rio de Janeiro', code: 'RIO', city: 'Rio de Janeiro', area: 32_000,
                        address: 'Avenida Copacabana, 202', cep: '32100-000',
                        description: 'Galpão da zona portuária do Rio')
      supplier = Supplier.create!(brand_name: 'Coca-Cola', corporate_name: 'Coca-Cola Indústrias LTDA',
                      registration_number: '00409096000146', full_address: 'Av. Zumbi dos Palmares, 4945',
                      city: 'Rio de Janeiro', state: 'RJ', zip: '32150-090', email: 'distribuidora@cocacola.com.br')
      order = Order.new(user: user, warehouse: warehouse,
                supplier: supplier, estimated_delivery_date: '2024-10-25')

      order.save!
      result = order.code

      expect(result).not_to be_empty
      expect(result.length).to eq 8
    end

    it 'and code is unique' do
      user = User.create!(name: 'Linda', email: 'linda@email.com', password: 'senha123')
      warehouse = Warehouse.create!(name: 'Rio de Janeiro', code: 'RIO', city: 'Rio de Janeiro', area: 32_000,
                        address: 'Avenida Copacabana, 202', cep: '32100-000',
                        description: 'Galpão da zona portuária do Rio')
      supplier = Supplier.create!(brand_name: 'Coca-Cola', corporate_name: 'Coca-Cola Indústrias LTDA',
                      registration_number: '00409096000146', full_address: 'Av. Zumbi dos Palmares, 4945',
                      city: 'Rio de Janeiro', state: 'RJ', zip: '32150-090', email: 'distribuidora@cocacola.com.br')
      first_order = Order.create!(user: user, warehouse: warehouse,
                    supplier: supplier, estimated_delivery_date: '2024-10-25')
      second_order = Order.new(user: user, warehouse: warehouse,
                    supplier: supplier, estimated_delivery_date: '2024-10-22')

      second_order.save!

      expect(second_order.code).not_to eq first_order.code
    end
  end
end
