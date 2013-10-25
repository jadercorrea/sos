require 'spec_helper'

describe Event do
  describe "scope" do
    describe "#this_month" do
      before do
        FactoryGirl.create(:event, start_datetime: 2.months.ago)
        @event = FactoryGirl.create(:event)
        FactoryGirl.create(:event, start_datetime: 1.month.from_now)
      end

      it "return event of the current month" do
        Event.this_month.to_a.should == [@event]
      end
    end
  end
end
