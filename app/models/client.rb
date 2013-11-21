class Client < ActiveRecord::Base
  attr_accessible :name

  has_many :tickets
  has_many :service_orders

  validates_presence_of :name

end
