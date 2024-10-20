require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#description' do
    it 'displays name and email' do
      u = User.new(name: 'Ana Maria', email: 'ana_maria@mail.com')

      result = u.description()

      expect(result).to eq 'Ana Maria - ana_maria@mail.com'
    end
  end
end
