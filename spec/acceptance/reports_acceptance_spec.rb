# encoding: utf-8
require "spec_helper"

feature "Reports" do
  background do
    login_into_admin
    @user = FactoryGirl.create(:user)
    FactoryGirl.create(:service_order, user: @user, total_time: "2:20")
    FactoryGirl.create(:service_order, user: @user, total_time: "1:20")
  end

  scenario "As admin, I see the total worked hours" do
    click_link "Relatórios"
    current_path.should == reports_path

    within ".user_#{@user.id}" do
      page.should have_content "#{@user.name}"
      page.should have_content "3:40"
    end
  end
end
