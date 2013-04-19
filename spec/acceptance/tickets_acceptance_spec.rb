# encoding: utf-8
require "spec_helper"

feature "Tickets" do
  background do
    login_into_admin
    FactoryGirl.create(:client)
  end

  scenario "As an client, I want to create a ticket" do
    click_link "Tickets"
    find(:xpath, "//a/img[@alt='Icon_new']/..").click

    select "Empire", from: "Client"
    fill_in "ticket_messages_attributes_0_text", with: "Aqui está um ticket"
    click_button "Create ticket"
    current_path.should == ticket_path(Ticket.last)
    page.should have_content "Aqui está um ticket"
    page.should have_content "Empire"

  end
  #scenario "As an client, I want to create a ticket message" do
  #  click_link "Tickets"
  #  find(:xpath, "//a/img[@alt='Icon_show']/..").click

  #  fill_in "Nova mensagem", with: "Uma mensagem nova para o ticket"
  #  click_button "New message"

  #  current_path.should == ticket_path(Ticket.last)
  #  page.should have_content "Aqui está um ticket"
  #  page.should have_content "Uma mensagem nova para o ticket"
  #  page.should have_content "Empire"
  #end  
end
