require 'spec_helper'

require './app/modules/registration/registration'
require './app/modules/grouper/grouper'
require './app/modules/match_maker/match_maker'

describe MatchMaker do
  let(:user)           { Registration.register :name => "Test", :email => "test@teste.com", :external_id => "0123456789" }
  let(:championship)   { Grouper.find_or_create_championship(user.id, "test") }
  let(:home_team_name) { "Arsenal" }
  let(:away_team_name) { "Manchester" }
  let(:home_flag_url)  { "http://www.asda-gifts.co.uk/common/client/Images/Product/Small/en-GB/3385-Arsenal-Logo.jpg" }
  let(:away_flag_url)  { "http://the11.ca/wp-content/uploads/2011/03/manchester-united-logo.png" }
  let(:home_team)      { Grouper.add_team(championship.id, home_team_name, home_flag_url) }
  let(:away_team)      { Grouper.add_team(championship.id, away_team_name, away_flag_url) }
  let(:group_name)     { "Group A" }
  let(:group)          { Grouper.add_group(user.id, championship.name, group_name) }

  context "matches" do
    subject { MatchMaker.add!(group, home_team, away_team) }

    it "creates a valid match" do
      subject.should be_valid
    end

    it "has a valid home_team" do
      subject.home_team.should == home_team
    end

    it "has a valid away_team" do
      subject.away_team.should == away_team
    end

    it "has a valid group" do
      subject.group.should == group
    end

    it "updates a match" do
      new_match = MatchMaker.change_match(subject.id, away_team, home_team)

      new_match.home_team.should == away_team
      new_match.away_team.should == home_team
    end

    it "adds official score" do
      home_team_score = 4
      away_team_score = 2
      match = MatchMaker.add_or_update_official_score(subject.id, home_team_score, away_team_score)

      match.home_team_score.should == home_team_score
      match.away_team_score.should == away_team_score
    end

    it "updates official score" do
      home_team_score = 2
      away_team_score = 4

      match = MatchMaker.add_or_update_official_score(subject.id, home_team_score, away_team_score)

      match.home_team_score.should == home_team_score
      match.away_team_score.should == away_team_score
    end

    it "updates scores when official score is changed" do
      subject
      user = User.first
      Bet.delete_all
      user.update_attribute :score, 0

      user.score.should == 0
      Registration.bet!(user, 8, 2, 3)

      match = MatchMaker.add_or_update_official_score(8, 2, 3)

      user.reload
      
      user.score.should == 3
    end
  end
end
