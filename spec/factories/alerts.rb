require 'faker'

FactoryGirl.define do
  factory :alert do
    association :creator, factory: :user
    description { Faker::Lorem.paragraph }
  end
end
