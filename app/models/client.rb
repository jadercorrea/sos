class Client < ActiveRecord::Base
  attr_accessible :name

  has_many :tickets
  validates_presence_of :name
end
