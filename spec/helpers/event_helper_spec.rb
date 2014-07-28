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

  describe ".next_month" do
    it "returns the next month" do
      expect(helper.next_month(7)).to eq(8)
      expect(helper.next_month(12)).to eq(1)
    end
  end

  describe ".next_year" do
    it "returns the next year" do
      expect(helper.next_year(7, 2013)).to eq(2013)
      expect(helper.next_year(12, 2013)).to eq(2014)
    end
  end

  describe ".previous_month" do
    it "returns the next month" do
      expect(helper.next_month(7)).to eq(8)
      expect(helper.next_month(12)).to eq(1)
    end
  end

  describe ".previous_year" do
    it "returns the previous year" do
      expect(helper.previous_year(7, 2013)).to eq(2013)
      expect(helper.previous_year(1, 2013)).to eq(2012)
    end
  end

  describe ".month_name" do
    it "returs the month name" do
      expect(helper.month_name(1)).to eq('Janeiro')
    end
  end
end
