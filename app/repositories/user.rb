require "active_repository"

class User < ActiveRepository::Base
  fields :name, :email, :external_id

  validates_uniqueness_of :external_id
end