require "spec_helper"

feature "Users profile creation" do
  background do
    login_into_admin
  end

  scenario "As an admin, I want to create another user" do
    click_link "Usuários"
    page.should have_content("Luke")

    click_link "new_user"

    fill_in "user_name",     with: "Juan"
    fill_in "user_email",    with: "juan@altavista.com"
    fill_in "user_password", with: "12345678"
    fill_in "user_password_confirmation", with: "12345678"
    select "Admin", from: "user_role_id"

    click_button "Create User"
    current_path.should == user_path(User.last)
    page.should have_content("Juan")
    page.should have_content("juan@altavista.com")

    # we then try to login with this user:w
    click_link "Logout"
    current_path.should == new_user_session_path
    fill_in "Email",    with: "juan@altavista.com"
    fill_in "Senha", with: "12345678" # new password
    click_button "Login"
    page.should have_content("Logout")
  end

  scenario "As admin, I can't create users with duplicated emails" do
    click_link "Usuários"
    page.should have_content("Luke")

    click_link "new_user"

    fill_in "user_name",     with: "Juan"
    fill_in "user_email",    with: @user.email
    fill_in "user_password", with: "12345678"
    fill_in "user_password_confirmation", with: "12345678"
    select "Admin", from: "user_role_id"

    click_button "Create User"
    page.should have_content "Email já foi usado por outro usuário"
    current_path.should == users_path
  end
end
