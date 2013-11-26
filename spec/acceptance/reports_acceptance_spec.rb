# encoding: utf-8
require "spec_helper"

feature "Reports" do
  background do
    login_into_admin
    @client = FactoryGirl.create(:user, :client)
    FactoryGirl.create(:service_order, user: @client, total_time: "2:20")
    FactoryGirl.create(:service_order, user: @client, total_time: "1:20")

    @colaborator = FactoryGirl.create(:user, :colaborator)
    FactoryGirl.create(:service_order, user: @colaborator, total_time: "3:20")
    FactoryGirl.create(:service_order, user: @colaborator, total_time: "1:20")
  end

  scenario "As admin, I see the total worked hours" do
    click_link "Relatórios"
    current_path.should == reports_path

    page.should_not have_selector ".user_#{@client.id}"
    page.should_not have_selector ".user_#{@user.id}"

    within ".user_#{@colaborator.id}" do
      page.should have_content "#{@client.name}"
      page.should have_content "4:40"
    end
  end
end
