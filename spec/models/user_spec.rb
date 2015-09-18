require 'rails_helper'

describe User do
  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it 'is valid with a first name, last name, username, email, phone number, and password' do
    user = build(:user)
    user.valid?
    expect(user.errors[:first_name]).not_to include("can't be blank")
  end

end