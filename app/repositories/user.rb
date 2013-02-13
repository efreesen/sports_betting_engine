require "active_repository"
require "./app/repositories/bet"

class User < ActiveRepository::Base
  fields :name, :email, :external_id

  has_many :bets

  validates_uniqueness_of :external_id
end