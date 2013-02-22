require 'spec_helper'

describe "service_orders/index" do
  before(:each) do
    assign(:service_orders, [
      stub_model(ServiceOrder,
        :client => nil,
        :module => "Module",
        :project => "Project",
        :reason => "Reason",
        :requestor => "Requestor",
        :start_time => "Start Time",
        :end_time => "End Time",
        :non_billable_hours => "Non Billable Hours",
        :other_billable_hours => "Other Billable Hours",
        :description => "MyText",
        :comment => "MyText"
      ),
      stub_model(ServiceOrder,
        :client => nil,
        :module => "Module",
        :project => "Project",
        :reason => "Reason",
        :requestor => "Requestor",
        :start_time => "Start Time",
        :end_time => "End Time",
        :non_billable_hours => "Non Billable Hours",
        :other_billable_hours => "Other Billable Hours",
        :description => "MyText",
        :comment => "MyText"
      )
    ])
  end

  it "renders a list of service_orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Module".to_s, :count => 2
    assert_select "tr>td", :text => "Project".to_s, :count => 2
    assert_select "tr>td", :text => "Reason".to_s, :count => 2
    assert_select "tr>td", :text => "Requestor".to_s, :count => 2
    assert_select "tr>td", :text => "Start Time".to_s, :count => 2
    assert_select "tr>td", :text => "End Time".to_s, :count => 2
    assert_select "tr>td", :text => "Non Billable Hours".to_s, :count => 2
    assert_select "tr>td", :text => "Other Billable Hours".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
