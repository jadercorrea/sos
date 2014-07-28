require 'spec_helper'

describe RolesHelper do
  let(:my_helper) { double }

  describe ".admin?" do
    before do
      my_helper.stub(:admin?).and_return(true)
      my_helper.stub(:colaborator?).and_return(false)
      my_helper.stub(:client?).and_return(false)
    end

    it "returns true" do
      expect(my_helper.admin?).to eq(true)
      expect(my_helper.colaborator?).to eq(false)
      expect(my_helper.client?).to eq(false)
    end
  end

  describe ".colaborator?" do
    before do
      my_helper.stub(:admin?).and_return(false)
      my_helper.stub(:colaborator?).and_return(true)
      my_helper.stub(:client?).and_return(false)
    end

    it "returns true" do
      expect(my_helper.admin?).to eq(false)
      expect(my_helper.colaborator?).to eq(true)
      expect(my_helper.client?).to eq(false)
    end
  end

  describe ".client?" do
    before do
      my_helper.stub(:admin?).and_return(false)
      my_helper.stub(:colaborator?).and_return(false)
      my_helper.stub(:client?).and_return(true)
    end

    it "returns true" do
      expect(my_helper.admin?).to eq(false)
      expect(my_helper.colaborator?).to eq(false)
      expect(my_helper.client?).to eq(true)
    end
  end
end
