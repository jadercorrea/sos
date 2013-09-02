class Client < ActiveRecord::Base
  attr_accessible :name, :price, :billable_hours, :taxes, :lunch, :status

  has_many :serviceorders, dependent: :destroy
  has_many :tickets, dependent: :destroy
  
  validates_presence_of :name
end
