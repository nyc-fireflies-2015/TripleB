require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  let(:user) { FactoryGirl.build(:user) }
  it 'has a first name' do
    user.valid?
    expect(user.errors[:first_name]).not_to include("can't be blank")
  end

end