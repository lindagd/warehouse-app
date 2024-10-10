require 'rails_helper'

# primerio cenário de teste

describe 'Usuário visita tela inicial' do
  it 'e vê o nome do app' do
    # Arrange
    # Act: visitar tela inicial
    visit('/')

    # Assert: espero q nessa tela tenha as palavras 'galpões' e 'estoque'
    expect(page).to have_content('Galpões e Estoque') 
  end

  it 'e vê lista de galpões cadastrados' do
    # Arrange: cadastro de 2 galpoes: Rio e Maceio
    Warehouse.create(name: 'Rio', code: 'SDU',
                     city: 'Rio de Janeiro', area: 60_000)
    Warehouse.create(name: 'Maceio', code: 'MCZ',
                     city: 'Maceio', area: 50_000)

    # Act: visitar tela inicial
    visit('/')

    # Assert: garantir que eu veja na tela os galpoes Rio e Maceio
    expect(page).not_to have_content('Não existem galpões cadastrados') 
    expect(page).to have_content('Rio')
    expect(page).to have_content('Código: SDU')
    expect(page).to have_content('Cidade: Rio de Janeiro')
    expect(page).to have_content('60000 m²')

    expect(page).to have_content('Maceio')
    expect(page).to have_content('Código: MCZ')
    expect(page).to have_content('Cidade: Maceio')
    expect(page).to have_content('50000 m²')
  end

  it 'e não existem galpões cadastrados' do
    # Arrange

    # Act
    visit('/')

    # Assert
    expect(page).to have_content('Não existem galpões cadastrados') 
  end
end
