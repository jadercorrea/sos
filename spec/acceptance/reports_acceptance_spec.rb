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

  scenario "As admin, I see the colaborator and client total hours" do
    click_link "Relatórios"
    current_path.should == reports_path

    page.should have_content "#{@colaborator.name}"
    page.should have_content "4:40"

    page.should have_content "#{@client.name}"
    page.should have_content "2:20"
    page.should have_content "1:20"
  end
end
