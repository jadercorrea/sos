FactoryGirl.define do
  factory :role do
    name "Admin"

    trait :colaborator do
      name "Colaborador"
    end
  end
end
