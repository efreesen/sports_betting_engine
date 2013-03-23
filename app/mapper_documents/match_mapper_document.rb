require "mongo_mapper"

class MatchMapperDocument
  include MongoMapper::Document
  set_collection_name "match_mapper_document"

  key :group_id,        String
  key :home_team_id,    String
  key :away_team_id,    String
  key :home_team_score, Integer
  key :away_team_score, Integer
  timestamps!
end
