require "mongoid"

class UserDocument
  include Mongoid::Document

  store_in collection: "users"

  field :name
  field :email
  field :external_id
  field :score
  field :updated_at
  field :created_at
end