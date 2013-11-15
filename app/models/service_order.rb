class ServiceOrder < ActiveRecord::Base
	belongs_to :client
	belongs_to :user

	attr_accessible :user_id, :client_id, :module, :project, :date, :reason, :requestor, :start_time, :end_time, :non_billable_hours, :other_billable_hours, :total_time, :description, :comment

	validates :user_id, :client_id, :module, :project, :date, :reason, :requestor, :start_time, :end_time, :total_time, :description, :presence => true
end
