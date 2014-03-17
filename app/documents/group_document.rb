require "mongoid"

class GroupDocument
  include Mongoid::Document

  store_in collection: "groups"

  field :name
  field :championship_id
  field :updated_at
  field :created_at
end