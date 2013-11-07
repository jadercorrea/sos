class Role < ActiveRecord::Base
	has_many :users

  attr_accessible :name

  validates_presence_of :name

  def admin?
    self.to_sym == :admin
  end

  def to_sym
    self.name.camelize.gsub(" ", "").underscore.to_sym
  end
end
