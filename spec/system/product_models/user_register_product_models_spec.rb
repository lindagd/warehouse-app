require 'rails_helper'

describe 'Usuário cadastra um modelo de produto' do
  it 'com sucesso' do
    supplier = Supplier.create!(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA',
                                registration_number: '00897633220012', full_address: 'Av Nações Unidas, 12',
                                city: 'São Paulo', state: 'SP', zip: '18098-008', email: 'sac@samsung.com.br')

    visit root_path
    click_on 'Modelos de produtos'
    click_on 'Cadastrar novo modelo de produto'
    
    fill_in 'Nome',	with: 'TV 40 Polegadas'
    fill_in 'Peso',	with: '10_000'
    fill_in 'Altura',	with: '60'
    fill_in 'Largura',	with: '90'
    fill_in 'Profundidade',	with: '8'
    fill_in 'SKU',	with: 'TV40-SAMS-XPT0'
    select 'Samsung', from: 'Fornecedor'
    click_on 'Enviar'

    expect(page).to have_content 'Modelo de produto cadastrado com sucesso'
    expect(page).to have_content 'TV 40 Polegadas'
    expect(page).to have_content 'Fornecedor: Samsung'
    expect(page).to have_content 'SKU: TV40-SAMS-XPT0'
    expect(page).to have_content 'Dimensões: 60cm x 90cm x 8cm'
    expect(page).to have_content 'Peso: 10000g'
  end
end
