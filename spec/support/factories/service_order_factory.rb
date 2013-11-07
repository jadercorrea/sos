FactoryGirl.define do
  factory :service_order do
    project "My project"
    date { Time.now }
    start_time "08:00"
    end_time "09:00"
    total_time "01:00"
    description "description"
    reason "reason"
    requestor "requestor"
    sequence(:module) { "description" }
    association :client
    association :user
  end
end
