class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :confirmable

	belongs_to :role

  attr_accessible :password, :password_confirmation, :remember_me
  attr_accessible :name, :email, :role_id

  validates :name, :email, :role_id, presence: true
  validates :password, presence: true, on: :creation
end
