module AcceptanceSteps
  def login_into_admin(user = nil)
    if user
      @user = user
    else
      @user ||= FactoryGirl.create(:user)
      user = @user
    end

    visit new_user_session_path

    fill_in "Email", with: user.email
    fill_in "Senha", with: "123456"

    click_button "Login"

    @user
  end
end
