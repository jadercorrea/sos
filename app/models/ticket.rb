class Ticket < ActiveRecord::Base
	attr_accessible :client_id, :messages_attributes, :status, :title

  has_many :messages, class_name: "TicketMessage"
  has_many :events

  belongs_to :client

  accepts_nested_attributes_for :messages
end
