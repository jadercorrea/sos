# encoding: utf-8
require "spec_helper"

feature "Tickets" do
  background do
    login_into_admin
    @client = FactoryGirl.create(:client, name: "Luan")
  end

  scenario "As admin, I want to the all the tickets" do
    FactoryGirl.create(:ticket, client: @client)

    click_link "Tickets"
    page.should have_content "Luan"
  end

  scenario "As an client, I want to create a ticket" do
    click_link "Tickets"
    click_link "new_ticket"

    select "Empire", from: "Client"
    fill_in "ticket_messages_attributes_0_text", with: "Aqui está um ticket"
    click_button "Create ticket"
    current_path.should == ticket_path(Ticket.last)
    page.should have_content "Aqui está um ticket"
    page.should have_content "Empire"
  end
end
