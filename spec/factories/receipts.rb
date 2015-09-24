require 'faker'

FactoryGirl.define do
  factory :receipt do
    distance { rand(100) }
    duration { rand(100) }
  end
end