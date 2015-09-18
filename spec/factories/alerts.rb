require 'faker'

FactoryGirl.define do
  factory :alert do
    creator_id { 1 }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
  end
end
