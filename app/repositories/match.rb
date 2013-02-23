require "active_repository"
require "./app/repositories/repository_support"
require "./app/repositories/group"
require "./app/repositories/team"
require "./app/models/match_model"
require "./app/documents/match_document"

class Match < ActiveRepository::Base
  fields :group_id, :home_team_id, :away_team_id, :home_team_score, :away_team_score

  belongs_to :group
  belongs_to :home_team, :class_name => Team
  belongs_to :away_team, :class_name => Team

  has_many :bets

  Match.set_model_class(eval("Match#{RepositorySupport.model_class_suffix}"))
  Match.set_save_in_memory(RepositorySupport.save_in_memory?)

  def self.add(championship_id, name)
    Group.find_or_create(:championship_id => championship_id, :name => name)
  end
end