require "active_repository"
require "./app/repositories/group"
require "./app/repositories/team"

class Match < ActiveRepository::Base
  fields :group_id, :home_team_id, :away_team_id, :home_team_score, :away_team_score

  belongs_to :group
  belongs_to :home_team, :class_name => Team
  belongs_to :away_team, :class_name => Team

  def self.add(championship_id, name)
    Group.find_or_create(:championship_id => championship_id, :name => name)
  end
end