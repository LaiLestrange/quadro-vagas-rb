require 'rails_helper'

describe "Usuário de Empresa se cadastra" do
  it "com sucesso" do
    visit root_path

    click_on 'Entrar'
    click_on 'Cadastrar'
    fill_in 'E-mail', with: 'user@email.com'
    fill_in 'Senha', with: 'p4ssw0rd'
    fill_in 'Confirme a senha', with: 'p4ssw0rd'
    click_on 'Cadastrar'

    expect(page).to have_content 'Cadastro realizado com sucesso.'
    expect(page).to have_content 'user@email.com'
  end
end
