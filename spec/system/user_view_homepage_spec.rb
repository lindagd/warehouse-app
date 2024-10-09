require 'rails_helper'

# primerio cenário de teste

describe 'Usuário visita tela inicial' do
  it 'e vê o nome do app' do
    # Arrange: o user não tem pré-requisitos
    # Act: visitar tela inicial
    visit('/')

    # Assert: espero q nessa tela tenha as palavras 'galpões' e 'estoque'
    expect(page).to have_content('Galpões e Estoque') 
  end
end
