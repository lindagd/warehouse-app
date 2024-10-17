require 'rails_helper'

describe 'Usuário cadastra um fornecedor' do
  it 'a partir da do menu' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'

    expect(page).to have_field('Nome fantasia')
    expect(page).to have_field('Razão social')
    expect(page).to have_field('CNPJ')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('CEP')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('E-mail')
  end

  it 'com sucesso' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'

    fill_in 'Nome fantasia',	with: 'Coca-Cola'
    fill_in 'Razão social',	with: 'Coca-Cola Indústrias LTDA' 
    fill_in 'CNPJ', with: '00623904000173'
    fill_in 'Endereço', with: 'Av. Automóvel Clube, 4945'
    fill_in 'CEP', with: '25272-030'
    fill_in 'Cidade', with: 'Duque de Caxias'
    fill_in 'Estado', with: 'RJ'
    fill_in 'E-mail', with: 'distribuidora@cocacola.com.br'
    click_on 'Enviar'

    expect(page).to have_content 'Fornecedor cadastrado com sucesso'
    expect(page).to have_content 'Coca-Cola'
    expect(page).to have_content 'Duque de Caxias – RJ'
    expect(page).to have_content 'distribuidora@cocacola.com.br'
  end

  it 'com dados incompletos' do
    visit root_path
    click_on 'Fornecedores'
    click_on 'Cadastrar novo fornecedor'

    fill_in 'Nome fantasia',	with: 'Coca-Cola'
    fill_in 'Razão social',	with: 'Coca-Cola Indústrias LTDA' 
    fill_in 'CNPJ', with: '00623904000173'
    fill_in 'Endereço', with: 'Av. Automóvel Clube, 4945'
    fill_in 'CEP', with: '25272-030'
    fill_in 'Cidade', with: ''
    click_on 'Enviar'

    expect(page).to have_content 'Fornecedor não cadastrado'
    expect(page).to have_content 'Cidade não pode ficar em branco'
    expect(page).to have_content 'Estado não pode ficar em branco'
    expect(page).to have_content 'E-mail não pode ficar em branco'
  end
end