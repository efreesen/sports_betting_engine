require "mongo_mapper"

class UserMapperDocument
  include MongoMapper::Document
  set_collection_name "user_mapper_document"

  key :name,        String
  key :email,       String
  key :external_id, String
  key :score,       Integer, :default => 0
  timestamps!
end
