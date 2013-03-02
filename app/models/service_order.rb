class ServiceOrder < ActiveRecord::Base
  belongs_to :client
  belongs_to :user

  attr_accessible :user_id, :client_id, :comment, :date, :description, :end_time, :module, :non_billable_hours, :other_billable_hours, :project, :reason, :requestor, :start_time

  validates_presence_of :user_id, :client_id, :date, :description, :end_time, :project, :reason, :requestor, :start_time

end
