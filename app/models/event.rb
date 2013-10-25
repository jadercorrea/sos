class Event < ActiveRecord::Base
  attr_accessible :title, :description, :start_datetime,
    :client, :user, :client_id, :user_id, :ticket_id

  belongs_to :client
  belongs_to :user

  validates :start_datetime, presence: true

  scope :this_month, ->{
    where("start_datetime > ?", Time.now.beginning_of_month)
      .where("start_datetime < ?", Time.now.end_of_month)
  }

  belongs_to :ticket
end
