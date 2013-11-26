FactoryGirl.define do
  factory :user do
    name "Luke Skywalker"
    sequence(:email) { |n| "thegoodson#{n}@rebels.org" }
    association :role
    password "123456"
    password_confirmation "123456"

    trait :colaborator do
      association :role, :colaborator
    end

    trait :client do
      association :role, :client
    end
  end
end
