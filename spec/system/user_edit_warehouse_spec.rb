require 'rails_helper'

describe 'Usuário edita um galpão' do
  it 'a partir da página de detalhes' do
    # arrange
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU',
                      city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 100', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    
    # act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    
    # assert
    expect(page).to have_content('Editar Galpão') 
    expect(page).to have_field('Nome', with: 'Aeroporto SP')
    expect(page).to have_field('Descrição')
    expect(page).to have_field('Código', with: 'GRU')
    expect(page).to have_field('Cidade', with: 'Guarulhos')
    expect(page).to have_field('Endereço', with: 'Avenida do Aeroporto, 100')
    expect(page).to have_field('CEP', with: '15000-000')
    expect(page).to have_field('Área', with: 100_000)
  end

  it 'com sucesso' do
    # arrange
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU',
                      city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 100', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    
    # act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome',	with: 'Rio de Janeiro' 
    fill_in 'Descrição',	with: 'Galpão da zona portuária do Rio' 
    fill_in 'Código',	with: 'RIO' 
    fill_in 'Endereço',	with: 'Avenida do Museu do Amanhã, 1000' 
    fill_in 'Cidade',	with: 'Rio de Janeiro' 
    fill_in 'CEP',	with: '32100-000' 
    fill_in 'Área',	with: '32000'
    click_on 'Enviar'

    # assert
    expect(page).to have_content('Galpão atualizado com sucesso')
    expect(page).to have_content('Rio de Janeiro')
    expect(page).to have_content('RIO')
    expect(page).to have_content('Galpão da zona portuária do Rio')
    expect(page).to have_content('Avenida do Museu do Amanhã, 1000')
    expect(page).to have_content('32100-000')
    expect(page).to have_content('32000 m²')
  end

  it 'e mantém os campos obrigatórios vazios' do
    # arrange
    Warehouse.create!(name: 'Aeroporto SP', code: 'GRU',
                      city: 'Guarulhos', area: 100_000,
                      address: 'Avenida do Aeroporto, 100', cep: '15000-000',
                      description: 'Galpão destinado para cargas internacionais')
    
    # act
    visit root_path
    click_on 'Aeroporto SP'
    click_on 'Editar'
    fill_in 'Nome',	with: '' 
    fill_in 'Descrição',	with: '' 
    fill_in 'Código',	with: '' 
    fill_in 'Endereço',	with: 'Avenida do Museu do Amanhã, 1000' 
    fill_in 'Cidade',	with: 'Rio de Janeiro' 
    click_on 'Enviar'

    # assert
    expect(page).to have_content('Não foi possível atualizar o galpão')
    expect(page).to have_content('Editar Galpão') 
    expect(page).to have_field('Nome', with: '')
    expect(page).to have_field('Descrição', with: '')
    expect(page).to have_field('Código', with: '')
    expect(page).to have_field('Cidade', with: 'Rio de Janeiro')
    expect(page).to have_field('Endereço', with: 'Avenida do Museu do Amanhã, 1000')
    expect(page).to have_field('CEP', with: '15000-000')
    expect(page).to have_field('Área', with: 100_000)
  end
end