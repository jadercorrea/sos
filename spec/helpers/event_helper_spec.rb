require 'spec_helper'

describe EventHelper do
  describe ".todays_events" do
    before do
      @events = [
        FactoryGirl.create(:event, start_datetime: 1.day.ago),
        FactoryGirl.create(:event, start_datetime: Time.new),
        FactoryGirl.create(:event, start_datetime: 1.day.from_now)
      ]
    end

    it "returns only events for today" do
      expected = 0.day.from_now
      helper.todays_events(@events, expected.day, expected.month, expected.year).should == [@events[1]]
    end
  end
end
