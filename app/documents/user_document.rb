require "mongoid"

class UserDocument
  include Mongoid::Document

  store_in collection: "users"

  field :_id, type: Integer, default: -> { UserDocument.last ? UserDocument.last.id + 1 : 1 }
  field :name
  field :email
  field :external_id
  field :score
  field :updated_at
  field :created_at
end