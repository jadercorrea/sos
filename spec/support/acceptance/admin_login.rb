module AcceptanceSteps
  def login_into_admin(user = FactoryGirl.create(:user))
    @user ||= user
    
    visit new_user_session_path

    fill_in "Email", with: @user.email
    fill_in "Senha", with: "123456"

    click_button "Login"
  end
end
