# encoding: utf-8
require "spec_helper"

feature "Tickets" do
  let(:user) { FactoryGirl.create(:user) }

  background do
    login_into_admin(user)
    @client  = FactoryGirl.create(:client, name: "Buiu")
    @client2 = FactoryGirl.create(:client, name: "Luan")
    role = FactoryGirl.create(:role, name: "Colaborador")
    @another_user = FactoryGirl.create(:user, role: role)
    @ticket  = FactoryGirl.create(:ticket, client: @client2, user: @another_user)
  end

  scenario "As admin, I want to see the all the tickets" do
    click_link "Tickets"
    page.should have_content "Luan"
    page.should have_content "Pendente"
  end

  scenario "As an client, I want to create a ticket" do
    click_link "Tickets"
    click_link "new_ticket"

    fill_in "ticket_title", with: "Título do ticket"
    select "Luan", from: "Cliente"
    page.should have_select "Status", options: ["Pendente", "Em andamento", "Resolvido"]
    select "Pendente", from: "Status"
    page.should have_selector("#ticket_user_id")
    fill_in "message_field", with: "Aqui está um ticket"
    click_button "Enviar"
    current_path.should == tickets_path
    page.should have_content "Título do ticket"
    page.should have_content "Luan"
    page.should have_content "Pendente"

    # Ticket's show page
    visit edit_ticket_path(Ticket.last)
    find("#ticket_title").value.should == "Título do ticket"
    page.should have_content "Aqui está um ticket"
    page.should have_content "Luan"
    page.should have_content "Pendente"
  end

  describe "editing" do
    background do
      visit edit_ticket_path(@ticket)
    end

    context "As a client" do
      let(:user) { FactoryGirl.create(:user, :client) }

      scenario "I can't change the ticket's client" do
        page.should_not have_selector "#ticket_client_id"
        page.should have_content "Cliente: #{@ticket.client.name}"
      end
    end

    context "As an admin" do
      scenario "I want to edit ticket's status" do
        page.should have_selector "#ticket_client_id"
        page.should have_content "Luan"
        page.should have_content "Pendente"

        select "Em andamento", from: "Status"
        # save_and_open_page
        select @another_user.name, from: "Colaborador"
        click_button "Enviar"
        page.should have_content "Luan"
        page.should have_content "Em andamento"
      end

      scenario "I want to add messages to a ticket" do
        first_message = @ticket.messages.first
        within ".message_#{first_message.id}" do
          page.should have_content @another_user.name
        end

        page.should have_content "This is a ticket message"

        fill_in "message_field", with: "My second message"
        click_button "Enviar"

        second_message = @ticket.messages.last
        within ".message_#{second_message.id}" do
          page.should have_content @user.name
        end
        page.should have_content "This is a ticket message"
        page.should have_content "My second message"
        current_path.should == edit_ticket_path(@ticket)
      end
    end
  end

  describe "relation with events" do
    scenario "As admin, I want to create an event for a ticket" do
      visit edit_ticket_path(@ticket)
      click_link "Agendar serviço relacionado"
      current_path.should == new_event_path

      find("#event_title").value.should == @ticket.title
      find("#event_client_id").value.should == @ticket.client_id.to_s

      click_button "Salvar"

      created_event = Event.last

      # Event page
      visit event_path(created_event)
      page.should have_content @ticket.title
      click_link @ticket.title

      current_path.should == edit_ticket_path(@ticket)
    end
  end
end
