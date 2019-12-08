FactoryBot.define do
  factory :entry do
    feeling { Faker::Number.between(from: 0, to: 3) }
    description { Faker::Lorem.words(number: 10) }
    hour { Time.now }
    day { Date.today}
    user
  end
end
