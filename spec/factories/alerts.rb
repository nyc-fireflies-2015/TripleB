require 'faker'

FactoryGirl.define do
  factory :alert do
    association :creator, factory: :user
    # association :location, factory: :location
    description { Faker::Lorem.paragraph }
  end
end
