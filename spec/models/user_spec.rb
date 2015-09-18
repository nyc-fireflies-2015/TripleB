require 'rails_helper'

describe User do
  let(:user) { FactoryGirl.build(:user) }
  it "has a valid factory" do
    expect(user).to be_valid
  end

end