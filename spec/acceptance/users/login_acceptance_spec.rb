require "spec_helper"

feature "Users login" do
  background do
    @user = FactoryGirl.create(:user)
  end

  scenario "As an admin, I want to login" do
    visit new_user_session_path

    fill_in "Email", with: @user.email
    fill_in "Senha", with: "123456"

    click_button "Login"
    page.should have_content("Roles")
    page.should have_content("Logout")
  end
end
