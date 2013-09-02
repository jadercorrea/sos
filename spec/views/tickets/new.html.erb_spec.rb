require 'spec_helper'

describe "tickets/new" do
  before(:each) do
    assign(:ticket, stub_model(Ticket,
      :client_id => 1,
      :title => "MyString",
      :description => "MyText",
      :situation => "MyString",
      :user_id => 1
    ).as_new_record)
  end

  it "renders new ticket form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => tickets_path, :method => "post" do
      assert_select "input#ticket_client_id", :name => "ticket[client_id]"
      assert_select "input#ticket_title", :name => "ticket[title]"
      assert_select "textarea#ticket_description", :name => "ticket[description]"
      assert_select "input#ticket_situation", :name => "ticket[situation]"
      assert_select "input#ticket_user_id", :name => "ticket[user_id]"
    end
  end
end
