require 'spec_helper'

require './app/repositories/user.rb'

describe User do
  subject { User.create :name => "Test", :email => "test@teste.com", :external_id => "0123456789" }

  before do
    subject.reload
  end

  after do
    User.delete_all
  end
  
  it "creates a valid user" do
    should be_valid
  end

  it "has User as test model_class" do
    User.get_model_class.should == User
  end
  
  it "validates uniqueness of external_id" do
    error_message = "External translation missing: en.activemodel.errors.models.user.attributes.external_id.taken"
    other = User.create :name => "Thomas", :email => "thomas@teste.com", :external_id => "0123456789"

    other.should_not be_valid
    other.errors.full_messages.should include(error_message)
  end
end
