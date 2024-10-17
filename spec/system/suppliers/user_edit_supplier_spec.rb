require 'rails_helper'

describe 'Usuário edita fornecedor' do
  it 'a partir da página de detalhes' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: '4938904567', zip: '90546-000',
                     full_address: 'Av das Palmas, 102', city: 'Santos',
                     state: 'SP', email: 'contato@acme.com.br')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    expect(page).to have_content 'Editar fornecedor'
    expect(page).to have_field('Nome fantasia', with: 'ACME')
    expect(page).to have_field('Razão social', with: 'ACME LTDA')
    expect(page).to have_field('CNPJ', with: '4938904567')
    expect(page).to have_field('Cidade', with: 'Santos')
    expect(page).to have_field('Estado', with: 'SP')
    expect(page).to have_field('CEP', with: '90546-000')
    expect(page).to have_field('E-mail', with: 'contato@acme.com.br')
    expect(page).to have_field('Endereço', with: 'Av das Palmas, 102')
  end

  it 'com sucesso' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: '4938904567', zip: '90546-000',
                     full_address: 'Av das Palmas, 102', city: 'Santos',
                     state: 'SP', email: 'contato@acme.com.br')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    fill_in 'Endereço',	with: 'Av. Antônio Teixeira, 99'
    fill_in 'Cidade', with: 'São Paulo'
    fill_in 'Estado', with: 'SP'
    fill_in 'CEP', with: '18905-090'
    click_on 'Enviar'

    expect(page).to have_content 'Fornecedor atualizado com sucesso'
    expect(page).to have_content 'ACME LTDA'
    expect(page).to have_content 'Endereço: Av. Antônio Teixeira, 99. São Paulo – SP, 18905-090'
    expect(page).to have_content 'E-mail: contato@acme.com.br'
  end

  it 'e mantém campos obrigatórios vazios' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: '4938904567', zip: '90546-000',
                     full_address: 'Av das Palmas, 102', city: 'Santos',
                     state: 'SP', email: 'contato@acme.com.br')
    
    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Editar'

    fill_in 'Endereço',	with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Estado', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Não foi possível atualizar o fornecedor'
    expect(page).to have_content 'Endereço não pode ficar em branco'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_field('Endereço', with: '')
    expect(page).to have_field('Cidade', with: '')
    expect(page).to have_field('Estado', with: '')
    expect(page).to have_field('Nome fantasia', with: 'ACME')
    expect(page).to have_field('Razão social', with: 'ACME LTDA')
    expect(page).to have_field('CNPJ', with: '4938904567')
    expect(page).to have_field('CEP', with: '90546-000')
    expect(page).to have_field('E-mail', with: 'contato@acme.com.br')
  end
end