require 'rails_helper'

describe Alert do
  context 'associations' do
    it 'should belong to creator (class name User)' do
      should belong_to(:creator).class_name("User")
    end
    it 'should belong to mechanic (class name User)' do
      should belong_to(:mechanic).class_name("User")
    end
    it 'should have many alert_issues' do
      should have_many :alert_issues
    end
    it 'should have many issues' do
      should have_many :issues
    end
  end
end