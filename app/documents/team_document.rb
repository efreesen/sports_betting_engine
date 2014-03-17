require "mongoid"

class TeamDocument
  include Mongoid::Document

  store_in collection: "teams"

  field :championship_id
  field :name
  field :flag_url
  field :updated_at
  field :created_at
end