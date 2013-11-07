require "string_time"

describe StringTime do
  describe "#total_time" do
    context "when there are times" do
      subject { described_class.new(["1:20", "2:50", "3:40"]) }

      it "returns 7:50" do
        subject.total_time.should == "7:50"
      end
    end

    context "when there are no times" do
      subject { described_class.new([]) }

      it "returns 0:00" do
        subject.total_time.should == "0:00"
      end
    end
  end
end
