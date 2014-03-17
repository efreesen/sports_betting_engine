require "mongoid"

class ChampionshipDocument
  include Mongoid::Document

  store_in collection: "championships"

  field :name
  field :owner_id
  field :updated_at
  field :created_at
end
