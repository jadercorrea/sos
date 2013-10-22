# encoding: utf-8
require "spec_helper"

feature "Tickets" do
  background do
    login_into_admin
    @client = FactoryGirl.create(:client, name: "Luan")
    FactoryGirl.create(:ticket, client: @client)
  end

  scenario "As admin, I want to see the all the tickets" do
    click_link "Tickets"
    page.should have_content "Luan"
  end

  scenario "As admin, I want to define ticket's status" do
    click_link "Tickets"
    page.should have_content "Luan"
    page.should have_content "Pendente"
  end

  scenario "As an client, I want to create a ticket" do
    click_link "Tickets"
    click_link "new_ticket"

    select "Luan", from: "Cliente"
    page.should have_select "Status", options: ["Pendente", "Em andamento", "Resolvido"]
    select "Pendente", from: "Status"
    fill_in "ticket_messages_attributes_0_text", with: "Aqui está um ticket"
    click_button "Create ticket"
    current_path.should == ticket_path(Ticket.last)
    page.should have_content "Aqui está um ticket"
    page.should have_content "Luan"
    page.should have_content "Pendente"
  end
end
