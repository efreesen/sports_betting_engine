require 'spec_helper'

require './app/modules/grouper/grouper.rb'

describe Grouper do
  let(:user) { Registration.register :name => "Test", :email => "test@teste.com", :external_id => "0123456789" }
  subject    { Grouper.get_group(user, "test") }

  it "creates a valid group" do
    subject.should be_valid
  end

  it "allows only one group per user" do
    group = Grouper.get_group(user)

    subject.should == group
  end

  it "changes the name of the group" do
    group = Group.find_by_owner_id(user.id)

    Grouper.change_name(user.id, "Group")

    group.name.should == "Group"
  end
end
