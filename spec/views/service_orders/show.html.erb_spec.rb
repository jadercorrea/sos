require 'spec_helper'

describe "service_orders/show" do
  before(:each) do
    @service_order = assign(:service_order, stub_model(ServiceOrder,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Module/)
    rendered.should match(/Project/)
    rendered.should match(/Reason/)
    rendered.should match(/Requestor/)
    rendered.should match(/Start Time/)
    rendered.should match(/End Time/)
    rendered.should match(/Non Billable Hours/)
    rendered.should match(/Other Billable Hours/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
