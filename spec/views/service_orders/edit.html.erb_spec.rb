require 'spec_helper'

describe "service_orders/edit" do
  before(:each) do
    @service_order = assign(:service_order, stub_model(ServiceOrder,
      :client => nil,
      :module => "MyString",
      :project => "MyString",
      :reason => "MyString",
      :requestor => "MyString",
      :start_time => "MyString",
      :end_time => "MyString",
      :non_billable_hours => "MyString",
      :other_billable_hours => "MyString",
      :description => "MyText",
      :comment => "MyText"
    ))
  end

  it "renders the edit service_order form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => service_orders_path(@service_order), :method => "post" do
      assert_select "input#service_order_client", :name => "service_order[client]"
      assert_select "input#service_order_module", :name => "service_order[module]"
      assert_select "input#service_order_project", :name => "service_order[project]"
      assert_select "input#service_order_reason", :name => "service_order[reason]"
      assert_select "input#service_order_requestor", :name => "service_order[requestor]"
      assert_select "input#service_order_start_time", :name => "service_order[start_time]"
      assert_select "input#service_order_end_time", :name => "service_order[end_time]"
      assert_select "input#service_order_non_billable_hours", :name => "service_order[non_billable_hours]"
      assert_select "input#service_order_other_billable_hours", :name => "service_order[other_billable_hours]"
      assert_select "textarea#service_order_description", :name => "service_order[description]"
      assert_select "textarea#service_order_comment", :name => "service_order[comment]"
    end
  end
end
