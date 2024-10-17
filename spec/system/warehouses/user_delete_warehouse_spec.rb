require 'rails_helper'

describe 'Usuário remove um galpão' do
  it 'com sucesso' do
    #arrange
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU',
                      city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 100', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    #act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Remover'

    #assert
    expect(current_path).to eq root_path 
    expect(page).to have_content('Galpão removido com sucesso')
    expect(page).not_to have_content('Aeroporto SP')  
    expect(page).not_to have_content('GRU')
  end
end