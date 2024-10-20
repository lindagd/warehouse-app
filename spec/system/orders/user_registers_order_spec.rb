require 'rails_helper'

describe 'User registers order' do
  it 'and must be authenticated' do
    visit root_path
    click_on 'Registrar Pedido'

    expect(current_path).to eq new_user_session_path
  end

  it 'sucessfully' do
    user = User.create!(name: 'Linda', email: 'linda@email.com', password: 'senha123')
    Warehouse.create!(name: 'Rio de Janeiro', code: 'RIO', city: 'Rio de Janeiro', area: 32_000,
                      address: 'Avenida Copacabana, 202', cep: '32100-000',
                      description: 'Galpão da zona portuária do Rio')
    warehouse = Warehouse.create(name: 'Aeroporto SP', code: 'GRU',
                     city: 'Guarulhos', area: 100_000,
                     address: 'Avenida do Aeroporto, 100', cep: '15000-000',
                     description: 'Galpão destinado para cargas internacionais')
    Supplier.create!(brand_name: 'Coca-Cola', corporate_name: 'Coca-Cola Indústrias LTDA',
                     registration_number: '00409096000146', full_address: 'Av. Zumbi dos Palmares, 4945',
                     city: 'Rio de Janeiro', state: 'RJ', zip: '32150-090', email: 'distribuidora@cocacola.com.br')
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA',
                                registration_number: '00897633220012', full_address: 'Av Nações Unidas, 12',
                                city: 'São Paulo', state: 'SP', zip: '18098-008', email: 'sac@samsung.com.br')

    login_as(user)
    visit root_path
    click_on 'Registrar Pedido'
    select "#{warehouse.code} - #{warehouse.name}", from: 'Galpão destino'
    select supplier.corporate_name, from: 'Fornecedor'
    fill_in 'Data prevista de entrega',	with: '04/11/2024'
    click_on 'Gravar'

    expect(page).to have_content 'Pedido registrado com sucesso'
    expect(page).to have_content 'Data prevista de entrega: 04 de novembro de 2024'
    expect(page).to have_content "Galpão destino: #{warehouse.full_description}"
    expect(page).to have_content "Fornecedor: #{supplier.corporate_name}"
    expect(page).to have_content "Usuário responsável: #{user.name} - #{user.email}"
  end
end
