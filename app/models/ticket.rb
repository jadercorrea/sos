class Ticket < ActiveRecord::Base
	attr_accessible :client_id, :messages_attributes, :status, :title, :user_id, :messages

  has_many :messages, class_name: "TicketMessage"
  has_many :events

  belongs_to :client
  belongs_to :user

  validates_presence_of :title

  accepts_nested_attributes_for :messages, reject_if: proc { |attrs|
    attrs["text"].blank?
  }
end
