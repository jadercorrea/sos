class Ticket < ActiveRecord::Base
  belongs_to :client
  belongs_to :user
  attr_accessible :client_id, :description, :situation, :title, :user_id

  has_many :comments
end
