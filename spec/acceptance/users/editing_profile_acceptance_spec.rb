require "spec_helper"

feature "Users profile" do
  background do
    login_into_admin

    FactoryGirl.create(:client)
    @new_user = FactoryGirl.create(:user,
                                   name: "Luan",
                                   email: "luan@altavista.com",
                                   role: @user.role)
  end

  scenario "As an user, I want to edit my profile" do
    click_link "Usuários"
    page.should have_content("Luke")
    page.should have_content("Luan")

    click_link "user_#{@new_user.id}"
    find("#user_name") .value.should == "Luan"
    find("#user_email").value.should == "luan@altavista.com"

    fill_in "user_name",     with: "Juan"
    fill_in "user_email",    with: "juan@altavista.com"
    fill_in "user_password", with: "12345678"
    fill_in "user_password_confirmation", with: "12345678"

    click_button "Update User"
    current_path.should == users_path
    page.should have_content("Juan")
    page.should have_content("juan@altavista.com")

    # we need to know if the password was updated
    click_link "Logout"
    current_path.should == new_user_session_path
    fill_in "Email",    with: "juan@altavista.com"
    fill_in "Senha", with: "12345678" # new password
    click_button "Login"
    page.should have_content("Logout")
  end
end
