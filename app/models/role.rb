class Role < ActiveRecord::Base
	has_many :users

  attr_accessible :name

  validates_presence_of :name

  def admin?
    self.to_sym == :admin
  end

  def colaborator?
    self.to_sym == :colaborador
  end

  def client?
    self.to_sym == :cliente
  end

  def to_sym
    self.name.camelize.gsub(" ", "_").underscore.to_sym
  end
end
