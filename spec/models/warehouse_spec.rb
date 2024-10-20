require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
    context 'present' do
      it 'false when name is empty' do
        # Arrange
        warehouse = Warehouse.new(name: '', code: 'RIO', address: 'Endereço',
                                  cep: '25768-000', city: 'Rio de Janeiro',
                                  area: 25000, description: 'Galpão do Rio') 
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false 
      end

      it 'false when code is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: '', address: 'Endereço',
                                  cep: '25768-000', city: 'Rio de Janeiro',
                                  area: 25000, description: 'Galpão do Rio')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when address is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: '',
                                  cep: '25768-000', city: 'Rio de Janeiro',
                                  area: 25000, description: 'Galpão do Rio')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end

      it 'false when cep is empty' do
        # Arrange
        warehouse = Warehouse.new(name: 'Rio', code: 'RIO', address: 'Endereço',
                                  cep: '', city: 'Rio de Janeiro',
                                  area: 25000, description: 'Galpão do Rio')
        # Act
        result = warehouse.valid?
        # Assert
        expect(result).to eq false
      end
    end

    it 'false when code is already in use' do
      # Arrange
      warehouse1 = Warehouse.create(name: 'Rio', code: 'RIO', address: 'Endereço 1',
                                  cep: '25768-000', city: 'Rio de Janeiro',
                                  area: 25000, description: 'Galpão do Rio')

      warehouse2 = Warehouse.create(name: 'Niterói', code: 'RIO', address: 'Endereço 2',
                                  cep: '25800-000', city: 'Niterói',
                                  area: 20000, description: 'Galpão de Niterói')

      expect(warehouse2).not_to be_valid
    end
  end

  describe '#full_description' do
    it 'displays name and code' do
      w = Warehouse.new(name: 'Galpão Cuiabá', code: 'CBA')

      result = w.full_description()

      expect(result).to eq 'CBA - Galpão Cuiabá'
    end
  end
end
