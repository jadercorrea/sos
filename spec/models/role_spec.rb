require "spec_helper"

describe Role do
  describe "#to_sym" do
    it "returns a symbol of the role name" do
      role = Role.new(name: "Admin")
      role.to_sym.should == :admin
    end

    it "returns a symbol of the role name even when with spaces" do
      role = Role.new(name: "Super Admin")
      role.to_sym.should == :super_admin
    end
  end
end
