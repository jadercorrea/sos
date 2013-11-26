FactoryGirl.define do
  factory :role do
    name "Admin"

    trait :colaborator do
      name "Colaborador"
    end

    trait :client do
      name "Cliente"
    end
  end
end
