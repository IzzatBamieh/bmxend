FactoryGirl.define do
  factory :bike do
  	name { Faker::StarWars.character }
  	brand { Faker::StarWars.specie }
    model { Faker::StarWars.droid }
    serial_number { Faker::StarWars.droid }
    place_of_purchase { Faker::StarWars.planet }
  end
end
