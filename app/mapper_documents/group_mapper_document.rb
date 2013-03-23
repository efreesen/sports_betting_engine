require "mongo_mapper"

class GroupMapperDocument
  include MongoMapper::Document
  set_collection_name "group_mapper_document"

  key :name,            String
  key :championship_id, String
  timestamps!
end
