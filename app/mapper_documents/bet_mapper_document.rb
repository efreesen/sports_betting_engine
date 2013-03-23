require "mongo_mapper"

class BetMapperDocument
  include MongoMapper::Document
  set_collection_name "bet_mapper_document"

  key :user_id,         String
  key :match_id,        String
  key :home_team_score, Integer
  key :away_team_score, Integer
  timestamps!
end
