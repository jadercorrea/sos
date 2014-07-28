require 'spec_helper'

describe Event do
  describe "atrr accessibility" do
    it { should allow_mass_assignment_of :title }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :start_datetime }
    it { should allow_mass_assignment_of :client }
    it { should allow_mass_assignment_of :user }
    it { should allow_mass_assignment_of :client_id }
    it { should allow_mass_assignment_of :user_id }
    it { should allow_mass_assignment_of :ticket_id }
  end

  describe "associations" do
    it { should belong_to :client }
    it { should belong_to :user}
    it { should belong_to :ticket }
  end

  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :client }
    it { should validate_presence_of :user }
  end

  describe "scope" do
    describe "#this_month" do
      before do
        FactoryGirl.create(:event, start_datetime: 2.months.ago)
        @event = FactoryGirl.create(:event)
        FactoryGirl.create(:event, start_datetime: 1.month.from_now)
      end

      it "return event of the current month" do
        year = @event.created_at.year
        month = @event.created_at.month
        Event.this_month(year, month).to_a.should == [@event]
      end
    end
  end
end
