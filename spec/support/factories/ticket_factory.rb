FactoryGirl.define do
  factory :ticket do
    sequence(:title) { |n| "Ticket title #{n}" }
    status "pending"
    association :client

    after(:create) do |ticket|
      FactoryGirl.create(:ticket_message, ticket: ticket)
    end
  end
end
