require "mongoid"

class TeamDocument
  include Mongoid::Document

  store_in collection: "teams"

  field :_id, type: Integer, default: -> { TeamDocument.last ? TeamDocument.last.id + 1 : 1 }
  field :championship_id
  field :name
  field :flag_url
  field :updated_at
  field :created_at
end