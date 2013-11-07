module AcceptanceSteps
  def login_into_admin
    @user ||= FactoryGirl.create(:user)
    puts @user.role.inspect
    visit new_user_session_path

    fill_in "Email", with: "thegoodson@rebels.org"
    fill_in "Senha", with: "123456"

    click_button "Login"
  end
end
