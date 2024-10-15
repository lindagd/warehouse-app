require 'rails_helper'

RSpec.describe Warehouse, type: :model do
  describe '#valid?' do
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
  end
  
  describe '#valid?' do
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
  end
  
  describe '#valid?' do
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
  end
  
  describe '#valid?' do
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
  
  
end
