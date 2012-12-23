require 'spec_helper'

require './app/modules/registration/registration.rb'

describe Registration do
  subject { Registration.register :name => "Test", :email => "test@teste.com", :external_id => "0123456789" }

  before do
    subject.reload
  end

  after do
    User.delete_all
  end
  
  it "registrates a valid user" do
    should be_valid
  end
  
  it "updates registered user's name" do
    name = "Johnny"
    
    other = Registration.update subject.external_id, :name, name

    other.name.should == name
  end

  it "updates registered user's email" do
    email = "johnny@test.com"
    
    other = Registration.update subject.external_id, :email, email

    other.email.should == email
  end

  it "do not update registered user's external_id" do
    id = "0937372826"
    
    other = Registration.update subject.external_id, :external_id, id

    other.external_id.should_not == id
    other.external_id.should == subject.external_id
  end

  it "updates an existing user at registration" do
    other = Registration.register :name => "Jack", :email => "jack@teste.com", :external_id => "0123456789"

    other.should be_valid
    other.id.should == subject.id
  end
end
