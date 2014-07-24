require "spec_helper"

describe Role do
  let(:role_super) { Role.new(name: "super admin") }
  let(:role_admin) { Role.new(name: "Admin") }
  let(:role_colaborator) { Role.new(name: "colaborador") }
  let(:role_client) { Role.new(name: "cliente") }

  describe "#to_sym" do
    it "returns a symbol of the role name if its capitalized" do
      role_admin.to_sym.should == :admin
    end

    it "returns a symbol of the role name even when with spaces" do
      role_super.to_sym.should == :super_admin
    end
  end

  describe "#admin?" do
    it "should return true only for a admin verification" do
      expect(role_admin.admin?).to eql(true)
      expect(role_admin.colaborator?).to eql(false)
      expect(role_admin.client?).to eql(false)
    end
  end

  describe "#colaborator?" do
    it "should return true only for a colaborator verification" do
      expect(role_colaborator.admin?).to eql(false)
      expect(role_colaborator.colaborator?).to eql(true)
      expect(role_colaborator.client?).to eql(false)
    end
  end

  describe "#client?" do
    it "should return true only for a client verification" do
      expect(role_client.admin?).to eql(false)
      expect(role_client.colaborator?).to eql(false)
      expect(role_client.client?).to eql(true)
    end
  end
end
