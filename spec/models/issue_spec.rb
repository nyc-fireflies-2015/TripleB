require 'rails_helper'

describe Alert do
  context 'associations' do

    it 'should have many alert_issues' do
      should have_many :alert_issues
    end

    it 'should have many alerts' do
      should have_many :alerts
    end
  end
end