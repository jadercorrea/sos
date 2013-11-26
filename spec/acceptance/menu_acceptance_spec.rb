require "spec_helper"

feature "Correct menus" do
  scenario "As an admin, I want to see the correct menus" do
    login_into_admin
    page.should have_content("Ordens de Serviço")
    page.should have_content("Tickets")
    page.should have_content("Clientes")
    page.should have_content("Usuários")
    page.should have_content("Roles")
    page.should have_content("Eventos")
    page.should have_content("Relatórios")
    page.should have_content("Logout")
  end

  scenario "As an colaborator, I want to see the correct menus" do
    colaborador = FactoryGirl.create(:role, name: "Colaborador")
    @user = FactoryGirl.create(:user, role: colaborador)
    login_into_admin(@user)

    page.should have_content("Ordens de Serviço")
    page.should have_content("Tickets")
    page.should have_content("Meu Perfil")
    page.should have_content("Eventos")
    page.should have_content("Logout")
  end

  scenario "As an client, I want to see the correct menus" do
    cliente = FactoryGirl.create(:role, name: "Cliente")
    @user = FactoryGirl.create(:user, role: cliente)
    login_into_admin(@user)

    page.should have_content("Ordens de Serviço")
    page.should have_content("Tickets")
    page.should have_content("Meu Perfil")
    page.should have_content("Eventos")
    page.should have_content("Logout")
  end

end
