require 'rails_helper'

describe 'User signs up' do
  it 'successfully' do
    visit root_path
    click_on 'Fazer Login'
    click_on 'Criar conta'
    fill_in 'Nome', with: 'Ana'
    fill_in 'E-mail',	with: 'ana@email.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Criar conta'

    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    within('.navbar') do
      expect(page).to have_button 'Sair'
      expect(page).not_to have_link 'Fazer Login'
      expect(page).to have_content 'ana@email.com'
    end
    expect(User.last.name).to eq 'Ana'
  end
end
