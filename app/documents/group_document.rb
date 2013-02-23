require "mongoid"

class GroupDocument
  include Mongoid::Document

  store_in collection: "groups"

  field :_id, type: Integer, default: -> { GroupDocument.last ? GroupDocument.last.id + 1 : 1 }
  field :name
  field :championship_id
  field :updated_at
  field :created_at
end