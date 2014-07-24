require 'spec_helper'

describe Client do
  let(:client) { FactoryGirl.create(:client) }

  describe "atrr accessibility" do
    it { should allow_mass_assignment_of :name }
  end

  describe "associations" do
    it { should have_many :tickets }
    it { should have_many :service_orders }
    it { should have_many :users }
    it { should have_many :events }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe "#total_time" do
    context "with times entered" do
      before do
        FactoryGirl.create(:service_order, client: client, start_time: "09:00", end_time: "17:00", total_time: "7:00")
      end

      it "returns the time spent" do
        expect(client.total_time).to eql("7:00")
      end
    end
  end
end
