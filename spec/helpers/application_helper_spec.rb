require 'spec_helper'

describe ApplicationHelper do
  let(:current_date) { Time.now.strftime("%d/%m/%Y") }

  describe ".current" do
    it 'returns current controller' do
      helper.stub(:current).and_return('current')
      expect(helper.current("current")).to eq('current')
    end

    it 'returns nil' do
      expect(helper.current("users")).to eq(nil)
    end
  end

  describe ".date" do
    it 'returns a formated current date' do
      expect(helper.date(Time.now)).to eq(current_date)
    end
  end
end
