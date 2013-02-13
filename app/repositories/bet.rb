require "active_repository"
require "./app/repositories/user"

class Bet < ActiveRepository::Base
  fields :user_id, :match_id, :home_team_score, :away_team_score

  belongs_to :user

  validates_uniqueness_of :match_id, :scope => :user_id
end