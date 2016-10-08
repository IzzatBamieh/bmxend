FactoryGirl.define do
  factory :police_report do
    lat { Faker::Number.decimal(2, 3) }
    lng { Faker::Number.decimal(2, 3) }
    time_locked { Faker::Date.between(3.days.ago, 2.days.ago) }
    time_discovered_stolen { Faker::Date.between(1.days.ago, Date.today) }
    status 'stolen'
    bike_id { Faker::Number.number(4) }
    user_id { Faker::Number.number(4) }
  end
end
