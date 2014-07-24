require 'spec_helper'

describe Ticket do
  describe "atrr accessibility" do
    it { should allow_mass_assignment_of :client_id }
    it { should allow_mass_assignment_of :messages_attributes }
    it { should allow_mass_assignment_of :status }
    it { should allow_mass_assignment_of :title }
    it { should allow_mass_assignment_of :user_id }
    it { should accept_nested_attributes_for :messages }
  end

  describe "associations" do
    it { should have_many :messages }
    it { should have_many :events }
    it { should belong_to :client }
    it { should belong_to :user }
  end
end
