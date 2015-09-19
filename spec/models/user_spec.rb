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

  it 'is invalid without a first name' do
    user = build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it 'is invalid without a last name' do
    user = build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it 'is invalid without a username' do
    user = build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it 'is invalid without a email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it 'is invalid without a phone number' do
    user = build(:user, phone: nil)
    user.valid?
    expect(user.errors[:phone]).to include("can't be blank")
  end

  it 'is invalid without a password' do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it 'is invalid with a duplicate email address' do
    create(:user, email: "test@test.com")
    user = build(:user, email: "test@test.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it 'is invalid with a duplicate username' do
    create(:user, username: "gp3gp3gp3")
    user = build(:user, username: "gp3gp3gp3")
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end

end