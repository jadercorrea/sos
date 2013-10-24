FactoryGirl.define do
  factory :event do
    title "My event"
    description "Event description"
    start_datetime { Time.now }
    association :client
    association :user
  end
end
