FactoryGirl.define do
  factory :ticket do
    sequence(:title) { |n| "Ticket title #{n}" }
    status "pending"
    association :client
    association :user

    after(:create) do |ticket|
      FactoryGirl.create(:ticket_message, ticket: ticket, user: ticket.user)
    end
  end
end
