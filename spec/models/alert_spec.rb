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

  context 'time difference module' do
    it 'calculates the time difference greater than a day' do
      alert = build(:alert)
      alert.update_attributes(created_at: Time.current - 3.years)
      expect(alert.time_diff).to eq '2 years ago'
    end

    it 'calculates the time difference greater than a day' do
      alert = build(:alert)
      alert.update_attributes(created_at: Time.current - 2.months)
      expect(alert.time_diff).to eq '2 months ago'
    end

    it 'calculates the time difference greater than a day' do
      alert = build(:alert)
      alert.update_attributes(created_at: Time.current - 2.days)
      expect(alert.time_diff).to eq '2 days ago'
    end

    it 'calculates the time difference greater than an hour' do
      alert = build(:alert)
      alert.update_attributes(created_at: Time.current - 3.5.hours)
      expect(alert.time_diff).to eq '3 hours ago'
    end

    it 'calculates time time less than an hour' do
      alert = build(:alert)
      alert.update_attributes(created_at: Time.current - 20.minutes)
      expect(alert.time_diff).to eq '20 minutes ago'
    end
  end

  context 'locate alerts' do
    it 'returns incomplete alerts' do
      user = create(:user)
      user_location = create(:location, latitude: 40.706392, longitude: -74.00912454, locatable_id: user.id, locatable_type: user.class)
      alert1 = create(:alert, status: 'complete')
      location1 = create(:location, latitude: 40.7063951, longitude: -74.00912459999999, locatable_id: alert1.id, locatable_type: alert1.class)
      alert2 = create(:alert)
      location2 = create(:location, latitude: 40.7063932, longitude: -74.009124524, locatable_id: alert2.id, locatable_type: alert2.class)
      expect(Alert.by_location(10, user.location)).to match_array([alert2])
    end
  end
end