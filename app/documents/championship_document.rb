require "mongoid"

class ChampionshipDocument
  include Mongoid::Document

  store_in collection: "championships"

  field :_id, type: Integer, default: -> { ChampionshipDocument.last ? ChampionshipDocument.last.id + 1 : 1 }
  field :name
  field :owner_id
  field :updated_at
  field :created_at
end
