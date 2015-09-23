# require 'rails_helper'

# describe Tag do
#   context 'validations' do

#     it 'has a valid factory' do
#       expect(build(:tag)).to be_valid
#     end

#     it 'is valid with a name' do
#       tag = build(:tag)
#       tag.valid?
#       expect(tag.errors[:name]).not_to include("can't be blank")
#     end

#     it 'is invalid with a name' do
#       tag = build(:tag, name: nil)
#       tag.valid?
#       expect(tag.errors[:name]).to include("can't be blank")
#     end

#   end

# end