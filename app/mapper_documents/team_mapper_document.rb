require "mongo_mapper"

class TeamMapperDocument
  include MongoMapper::Document
  set_collection_name "team_mapper_document"

  key :championship_id, String
  key :name,            String
  key :flag_url,        String
  timestamps!
end
