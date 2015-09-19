require 'faker'

FactoryGirl.define do
  factory :alert do
    association :creator, factory: :user
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    description { Faker::Lorem.paragraph }
  end
end
