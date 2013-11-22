class Client < ActiveRecord::Base
  attr_accessible :name

  has_many :tickets
  has_many :service_orders
  has_many :users
  has_many :events

  validates_presence_of :name

  def total_time
    total = self.service_orders.map { |a| a.total_time }
    StringTime.new(total).total_time
  end

end
