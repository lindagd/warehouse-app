require 'rails_helper'

describe 'Usuário vê detalhes de um fornecedor' do
  it 'a partir da tela inicial' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: '4938904567', zip: '90546-000',
                     full_address: 'Av das Palmas, 102', city: 'Santos',
                     state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'

    expect(page).to have_content 'ACME LTDA' 
    expect(page).to have_content 'Registro: 4938904567'
    expect(page).to have_content 'Endereço: Av das Palmas, 102. Santos – SP, 90546-000'
    expect(page).to have_content 'E-mail: contato@acme.com.br'
  end

  it 'e volta para a tela inicial' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: 4938904567, zip: '90546-000',
                     full_address: 'Av das Palmas, 102', city: 'Santos',
                     state: 'SP', email: 'contato@acme.com.br')

    visit root_path
    click_on 'Fornecedores'
    click_on 'ACME'
    click_on 'Voltar'

    expect(current_path).to eq root_path 
  end
end