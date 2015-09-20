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

  context 'model methods' do

    it 'calculates the time difference' do
      alert = build(:alert)
      alert.update_attributes(created_at: Time.current - 3.5.hours)
      expect(alert.time_diff).to eq '3 hours and 30 minutes ago'
    end

    it 'converts a string into Tag objects' do
      expect{build(:alert, all_tags: 'frame, tube')}.to change(Tag, :count).by 2
    end
    
  end

end