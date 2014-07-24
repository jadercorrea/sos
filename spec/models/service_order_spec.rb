require 'spec_helper'

describe ServiceOrder do
  describe "atrr accessibility" do
    it { should allow_mass_assignment_of :user_id }
    it { should allow_mass_assignment_of :client_id }
    it { should allow_mass_assignment_of :module }
    it { should allow_mass_assignment_of :project }
    it { should allow_mass_assignment_of :date }
    it { should allow_mass_assignment_of :reason }
    it { should allow_mass_assignment_of :requestor }
    it { should allow_mass_assignment_of :start_time }
    it { should allow_mass_assignment_of :end_time }
    it { should allow_mass_assignment_of :non_billable_hours }
    it { should allow_mass_assignment_of :other_billable_hours }
    it { should allow_mass_assignment_of :total_time }
    it { should allow_mass_assignment_of :description }
    it { should allow_mass_assignment_of :comment }
  end

  describe "associations" do
    it { should belong_to :client }
    it { should belong_to :user }
  end

  describe "validations" do
    it { should validate_presence_of :user_id }
    it { should validate_presence_of :client_id }
    it { should validate_presence_of :module }
    it { should validate_presence_of :project }
    it { should validate_presence_of :date }
    it { should validate_presence_of :reason }
    it { should validate_presence_of :requestor }
    it { should validate_presence_of :start_time }
    it { should validate_presence_of :end_time }
    it { should validate_presence_of :total_time }
    it { should validate_presence_of :description }
  end
end
