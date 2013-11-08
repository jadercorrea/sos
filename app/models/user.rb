class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

	belongs_to :role

  has_many :service_orders

  attr_accessible :password, :password_confirmation, :remember_me
  attr_accessible :name, :email, :role_id

  validates :name, :email, :role_id, presence: true
  validates :password, presence: true, on: :creation

  scope :colaborators, -> { joins(:role).where("roles.name = ?", "Colaborador") }

  def total_time
    worked_times = self.service_orders.map(&:total_time)
    StringTime.new(worked_times).total_time
  end

  def admin?
    role.admin?
  end
end
