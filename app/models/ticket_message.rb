class TicketMessage < ActiveRecord::Base
  attr_accessible :text, :ticket_id, :user_id

  belongs_to :ticket
  belongs_to :user
end
