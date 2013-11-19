# encoding: utf-8
require "spec_helper"

feature "Events" do
  background do
    login_into_admin
    @client = FactoryGirl.create(:client, name: "Luan")
  end

  scenario "As admin, I want to create an event" do
    Timecop.travel(Time.utc(2013, 10, 24, 10, 0, 0)) do
      click_link "Eventos"
      click_link "new_event"

      fill_in "event_title", with: "Meu evento"
      fill_in "event_description", with: "Descrição do evento"

      select "24", from: "event_start_datetime_3i"
      select "Outubro", from: "event_start_datetime_2i"
      select "2013", from: "event_start_datetime_1i"

      select "Luan", from: "event_client_id"

      click_button "Salvar"

      current_path.should == events_path

      within ".day_24" do
        page.should have_content "Luke"
      end
    end
  end
end
