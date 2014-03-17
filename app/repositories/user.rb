require "./app/repositories/base_repository"
require "./app/repositories/bet"
require "./app/models/user_model"
require "./app/documents/user_document"

class User < BaseRepository
  fields :name, :email, :external_id, :score, :created_at, :updated_at

  has_many :bets

  validates_uniqueness_of :external_id
end