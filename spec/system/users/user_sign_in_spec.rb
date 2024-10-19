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
      expect(page).to have_button 'Sair'
      expect(page).not_to have_link 'Fazer Login'
      expect(page).to have_content 'linda@email.com'
    end
  end

  it 'and logs out' do
    User.create!(email: 'linda@email.com', password: 'dummy-password')

    visit root_path
    click_on 'Fazer Login'
    within('form') do
      fill_in 'E-mail', with: 'linda@email.com'
      fill_in 'Senha', with: 'dummy-password'
      click_on 'Entrar'
    end
    click_on 'Sair'

    expect(page).to have_content 'Logout efetuado com sucesso.'
    within('.navbar') do
      expect(page).to have_content 'Fazer Login'
      expect(page).not_to have_button 'Sair'
      expect(page).not_to have_content 'linda@email.com'
    end
  end
end
