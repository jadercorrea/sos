require 'spec_helper'

describe TicketMessage do
  describe "atrr accessibility" do
    it { should allow_mass_assignment_of :text }
    it { should allow_mass_assignment_of :ticket_id }
    it { should allow_mass_assignment_of :user_id }
  end

  describe "associations" do
    it { should belong_to :ticket }
    it { should belong_to :user }
  end
end
