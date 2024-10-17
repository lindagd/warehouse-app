require 'rails_helper'

describe 'Usuário vê fornecedores' do
  it 'a partir do menu inicial' do
    visit root_path
    within('.navbar') do
      click_on 'Fornecedores'
    end

    expect(current_path).to eq suppliers_path 
  end

  it 'com sucesso' do
    Supplier.create!(corporate_name: 'ACME LTDA', brand_name: 'ACME',
                     registration_number: 4938904567, zip: '90546-000',
                     full_address: 'Av das Palmas, 102', city: 'Santos',
                     state: 'SP', email: 'contato@acme.com.br')
    Supplier.create!(corporate_name: 'Pernambucanas LTDA', brand_name: 'Pernambucanas',
                     registration_number: 9004563212, zip: '40090-100',
                     full_address: 'Rua Monsenhor Galvão, 230', city: 'Recife',
                     state: 'PE', email: 'contato@pernambucanas.com.br')
    
    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content 'Fornecedores' 
    expect(page).to have_content 'ACME' 
    expect(page).to have_content 'Santos – SP'
    expect(page).to have_content 'contato@acme.com.br'
    expect(page).to have_content 'Pernambucanas'
    expect(page).to have_content 'Recife – PE' 
    expect(page).to have_content 'contato@pernambucanas.com.br' 
  end

  it 'e não existem fornecedores cadastrados' do
    visit root_path
    click_on 'Fornecedores'

    expect(page).to have_content 'Não existem fornecedores cadastrados' 
  end
end