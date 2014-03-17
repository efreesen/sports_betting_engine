require "active_repository"
require "./app/repositories/base_repository"
require "./app/repositories/user"
require "./app/models/bet_model"
require "./app/documents/bet_document"

class Bet < BaseRepository
  fields :user_id, :match_id, :home_team_score, :away_team_score, :created_at, :updated_at

  belongs_to :user
  belongs_to :match

  validates_presence_of :home_team_score, :away_team_score
end