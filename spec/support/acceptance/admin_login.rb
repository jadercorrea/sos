module AcceptanceSteps
  def login_into_admin
    @user ||= FactoryGirl.create(:user)
    visit new_user_session_path

    fill_in "Email", with: "thegoodson@rebels.org"
    fill_in "Password", with: "123456"

    click_button "Sign in"
  end
end
