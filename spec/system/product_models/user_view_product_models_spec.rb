require 'rails_helper'

describe 'Usuário vê modelos de produtos' do
  it 'a partir do menu' do
    visit root_path
    within('.navbar') do
      click_on 'Modelos de produtos'
    end

    expect(current_path).to eq product_models_path
  end

  it 'com sucesso' do
    supplier = Supplier.new(brand_name: 'Samsung', corporate_name: 'Samsung Eletronics LTDA',
                            registration_number: '00897633220012', full_address: 'Av Nações Unidas, 12',
                            city: 'São Paulo', state: 'SP', zip: '18098-008', email: 'sac@samsung.com.br')

    ProductModel.create!(name: 'TV 32', weight: 8000, width: 70, height: 54,
                         depth: 5, sku: 'TV32-SAMS-XPTO90', supplier: )
    ProductModel.create!(name: 'Smartphone Z-Flip', weight: 900, width: 10, height: 16,
                         depth: 0.8, sku: 'SPZF-SAMS-XRT101', supplier: supplier)

    visit root_path
    click_on 'Modelos de produtos'

    expect(page).to have_content 'TV 32'
    expect(page).to have_content 'TV32-SAMS-XPTO90'
    expect(page).to have_content 'Samsung'
    expect(page).to have_content 'Smartphone Z-Flip'
    expect(page).to have_content 'SPZF-SAMS-XRT101'
    expect(page).to have_content 'Samsung'
  end

  it 'e não existem produtos cadastrados' do
    visit root_path
    click_on 'Modelos de produtos'

    expect(page).to have_content 'Não existem modelos de produtos cadastrados'
  end
end
