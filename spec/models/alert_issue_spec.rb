require 'rails_helper'

describe AlertIssue do
  context 'associations' do

    it 'should belong to alert (class name Alert)' do
      should belong_to(:alert).class_name("Alert")
    end

    it 'should belong to issue (class name Issue)' do
      should belong_to(:issue).class_name("Issue")
    end
    
  end
end