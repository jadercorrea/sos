require "spec_helper"

describe User do
  describe "#total_time" do
    subject { FactoryGirl.create(:user) }

    it "returns the total time worked by the user" do
      FactoryGirl.create(:service_order, user: subject, total_time: "2:20")
      FactoryGirl.create(:service_order, user: subject, total_time: "1:20")

      subject.total_time.should == "3:40"
    end
  end
end
