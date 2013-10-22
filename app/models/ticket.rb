class Ticket < ActiveRecord::Base
	attr_accessible :client_id, :messages_attributes, :status

  has_many :messages, class_name: "TicketMessage"
  belongs_to :client

  accepts_nested_attributes_for :messages
end
