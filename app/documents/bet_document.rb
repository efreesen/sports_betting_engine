require "mongoid"

class BetDocument
  include Mongoid::Document

  store_in collection: "bets"

  field :_id, type: Integer, default: -> { BetDocument.last ? BetDocument.last.id + 1 : 1 }
  field :user_id
  field :match_id
  field :home_team_score
  field :away_team_score
  field :updated_at
  field :created_at
end