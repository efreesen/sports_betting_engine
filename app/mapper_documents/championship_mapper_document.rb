require "mongo_mapper"

class ChampionshipMapperDocument
  include MongoMapper::Document
  set_collection_name "championship_mapper_document"

  key :name,     String
  key :owner_id, String
  timestamps!

  attr_accessible :name, :owner, :created_at, :updated_at
end
