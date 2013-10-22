FactoryGirl.define do
  factory :ticket_message do
    text "This is a ticket message"
    association :ticket
  end
end
