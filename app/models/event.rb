class Event < ActiveRecord::Base
  attr_accessible :title, :description, :start_datetime,
    :client, :user, :client_id, :user_id

  belongs_to :client
  belongs_to :user
end
