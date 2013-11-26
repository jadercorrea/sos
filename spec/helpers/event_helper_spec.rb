require 'spec_helper'

describe EventHelper do
  describe ".todays_events" do
    before do
      @events = [
        FactoryGirl.create(:event, start_datetime: 1.day.ago),
        FactoryGirl.create(:event, start_datetime: Time.now),
        FactoryGirl.create(:event, start_datetime: 1.day.from_now)
      ]
    end

    it "returns only events for today" do
      helper.todays_events(@events, Time.new.day, Time.new.month, Time.new.year).should == [@events[1]]
    end
  end
end
