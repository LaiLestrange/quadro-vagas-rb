require "rails_helper"

describe "Usuário faz login" do
  it "com sucesso" do
    create(:user, email: "user@email.com", password: "passw0rd")

    visit root_path
    click_on "Entrar"
    fill_in "E-mail", with: "user@email.com"
    fill_in "Senha", with: "passw0rd"
    click_on "Login"

    expect(page).to have_content "user@email.com"
    expect(page).to have_button "Logout"
  end

  it "e faz logout" do
    user = create(:user)

    login_as user, scope: :user
    visit root_path
    click_on "Logout"

    expect(page).to have_content "Logout efetuado com sucesso."
  end
end
