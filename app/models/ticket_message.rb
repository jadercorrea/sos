class TicketMessage < ActiveRecord::Base
  attr_accessible :text, :ticket_id

  belongs_to :ticket
  belongs_to :user
end
