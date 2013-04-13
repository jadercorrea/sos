# encoding: utf-8
require "spec_helper"

feature "Tickets" do
  background do
    login_into_admin
  end

  scenario "As an client, I want to create a ticket" do
    click_link "Tickets"
    click_link "Novo ticket"

    fill_in "Mensagem", with: "Aqui está um ticket"
    click_button "Criar ticket"
    current_path.should == ticket_path(Ticket.last)
    page.should have_content "Aqui está um ticket"
  end
end
