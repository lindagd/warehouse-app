require 'rails_helper'

describe 'User signs in' do
  it 'successfully' do
    User.create!(email: 'linda@email.com', password: 'dummy-password')

    visit root_path
    click_on 'Fazer Login'

    within('form') do
      fill_in 'E-mail', with: 'linda@email.com'
      fill_in 'Senha', with: 'dummy-password'
      click_on 'Entrar'
    end

    expect(page).to have_content 'Login efetuado com sucesso.'
    within('.navbar') do
      expect(page).to have_link 'Sair'
      expect(page).not_to have_link 'Fazer Login'
      expect(page).to have_content 'linda@email.com'
    end
  end
end
