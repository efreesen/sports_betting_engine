require "mongoid"

class MatchDocument
  include Mongoid::Document

  store_in collection: "matchs"

  field :_id, type: Integer, default: -> { MatchDocument.last ? MatchDocument.last.id + 1 : 1 }
  field :group_id
  field :home_team_id
  field :away_team_id
  field :home_team_score
  field :away_team_score
  field :updated_at
  field :created_at
end