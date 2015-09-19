require 'rails_helper'

describe Alert do
  context 'validations' do

    it 'has a valid factory' do
      expect(build(:alert)).to be_valid
    end

    it 'is valid with a creator and a description' do
      alert = build(:alert)
      alert.valid?
      expect(alert.errors[:description]).not_to include("can't be blank")
      expect(alert.errors[:creator]).not_to include("can't be blank")
    end

    it 'is invalid without a description' do
      alert = build(:alert, description: nil)
      alert.valid?
      expect(alert.errors[:description]).to include("can't be blank")
    end

    it 'is invalid without a creator' do
      alert = build(:alert, creator: nil)
      alert.valid?
      expect(alert.errors[:creator]).to include("can't be blank")
    end

  end

end