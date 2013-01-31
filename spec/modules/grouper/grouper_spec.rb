require 'spec_helper'

require './app/modules/grouper/grouper'

describe Grouper do
  let(:user) { Registration.register :name => "Test", :email => "test@teste.com", :external_id => "0123456789" }

  context "championships" do
    subject { Grouper.find_or_create_championship(user.id, "test") }

    it "creates a valid championship" do
      subject.should be_valid
    end

    it "allows only one championship per user" do
      championship = Grouper.find_or_create_championship(user.id)

      subject.should == championship
    end

    it "changes the name of the championship" do
      championship = Championship.find_by_owner_id(user.id)

      Grouper.change_name(user.id, "Championship")

      championship.name.should == "Championship"
    end
  end

  context "teams" do
    let(:championship) { Grouper.find_or_create_championship(user.id, "test") }
    let(:team_name)    { "Arsenal" }
    let(:flag_url)     { "http://www.asda-gifts.co.uk/common/client/Images/Product/Small/en-GB/3385-Arsenal-Logo.jpg" }
    subject            { Grouper.add_team(championship.id, team_name, flag_url) }
    
    it "adds a new team" do
      subject.should be_valid
      subject.name.should == team_name
    end

    it "prevents teams with the same name" do
      # initializing subject variable
      subject

      other_flag_url = "http://non_existent.com"
      other_team     = Grouper.add_team(user.id, team_name, other_flag_url)

      subject.reload

      subject.id.should       == other_team.id
      subject.flag_url.should == other_flag_url
    end
  end

  context "groups" do
    let(:championship)   { Grouper.find_or_create_championship(user.id, "test") }
    let(:home_team_name) { "Arsenal" }
    let(:away_team_name) { "Manchester" }
    let(:home_flag_url)  { "http://www.asda-gifts.co.uk/common/client/Images/Product/Small/en-GB/3385-Arsenal-Logo.jpg" }
    let(:away_flag_url)  { "http://the11.ca/wp-content/uploads/2011/03/manchester-united-logo.png" }
    let(:home_team)      { Grouper.add_team(championship.id, home_team_name, home_flag_url) }
    let(:away_team)      { Grouper.add_team(championship.id, away_team_name, away_flag_url) }
    let(:group_name)     { "Group A" }
    subject              { Grouper.add_group(user.id, championship.name, group_name) }

    it "adds a new group" do
      subject.should be_valid
      subject.name.should == group_name
    end

    it "prevents groups with the same name on the same championship" do
      subject

      other_name  = group_name
      other_group = Grouper.add_group(user.id, championship.name, group_name)

      subject.reload

      subject.id.should   == other_group.id
      subject.name.should == other_name
    end
  end
end
