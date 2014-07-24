require "spec_helper"

describe User do
  let(:client) { FactoryGirl.create(:client) }
  let(:colaborator_role) { FactoryGirl.create(:role, name: "Colaborador" ) }
  let(:client_role) { FactoryGirl.create(:role, name: "Cliente") }

  let(:colaborator_user) { FactoryGirl.create(:user, role_id: colaborator_role.id) }
  let(:client_user) { FactoryGirl.create(:user, role_id: client_role.id, client_id: client.id ) }

  subject { FactoryGirl.create(:user) }

  describe "attr accessibility" do
    it { should allow_mass_assignment_of :password }
    it { should allow_mass_assignment_of :password_confirmation }
    it { should allow_mass_assignment_of :remember_me }
    it { should allow_mass_assignment_of :name }
    it { should allow_mass_assignment_of :email }
    it { should allow_mass_assignment_of :role_id }
    it { should allow_mass_assignment_of :client_id }
  end

  describe "associations" do
    it { should belong_to :role }
    it { should belong_to :client }
    it { should have_many :service_orders }
  end

  describe "validations" do
    it { should validate_presence_of :name}
    it { should validate_presence_of :role_id}
    it { should validate_presence_of :email}
    it { should validate_uniqueness_of :email}
  end

  describe "#admin?" do
    it "should return true when user role is admin" do
      expect(subject.admin?).to eql(true)
      expect(subject.colaborator?).to eql(false)
      expect(subject.client?).to eql(false)
    end
  end

  describe "#colaborator?" do
    it "should return true when user role is colaborator" do
      expect(colaborator_user.admin?).to eql(false)
      expect(colaborator_user.colaborator?).to eql(true)
      expect(colaborator_user.client?).to eql(false)
    end
  end

  describe "#client?" do
    it "should return true when user role is client" do
      expect(client_user.admin?).to eql(false)
      expect(client_user.colaborator?).to eql(false)
      expect(client_user.client?).to eql(true)
    end
  end

  describe "#client_name" do
    it "should return the clients name when user is a client" do
      expect(client_user.client_name).to eql("Empire")
      expect(colaborator_user.client_name).to eql(nil)
    end
  end

  describe "#total_time" do
    it "returns the total time worked by the user" do
      FactoryGirl.create(:service_order, user: subject, total_time: "2:20")
      FactoryGirl.create(:service_order, user: subject, total_time: "1:20")

      subject.total_time.should == "3:40"
    end
  end
end
