# encoding: utf-8
require "spec_helper"

feature "Tickets" do
  background do
    login_into_admin
    @client = FactoryGirl.create(:client, name: "Luan")
    @ticket = FactoryGirl.create(:ticket, client: @client)
  end

  scenario "As admin, I want to see the all the tickets" do
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
    fill_in "message_field", with: "Aqui está um ticket"
    click_button "Salvar"
    current_path.should == tickets_path
    page.should have_content "Luan"
    page.should have_content "Pendente"

    visit edit_ticket_path(Ticket.last)
    page.should have_content "Aqui está um ticket"
    page.should have_content "Luan"
    page.should have_content "Pendente"
  end

  describe "editing" do
    background do
      visit edit_ticket_path(@ticket)
    end

    scenario "As admin, I want to edit ticket's status" do
      page.should have_content "Luan"
      page.should have_content "Pendente"

      select "Em andamento", from: "Status"
      click_button "Salvar"
      page.should have_content "Luan"
      page.should have_content "Em andamento"
    end

    scenario "As admin, I want to add messages to a ticket" do
      page.should have_content "This is a ticket message"

      fill_in "message_field", with: "My second message"
      click_button "Salvar"

      page.should have_content "This is a ticket message"
      page.should have_content "My second message"
      current_path.should == edit_ticket_path(@ticket)
    end
  end
end
