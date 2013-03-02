class User < ActiveRecord::Base
	belongs_to :role
  	attr_accessible :name

  	validates_presence_of :name, :mail, :password, :role_id

end
