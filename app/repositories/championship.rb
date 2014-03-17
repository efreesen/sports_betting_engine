require "active_repository"
require "./app/repositories/base_repository"
require "./app/repositories/user"
require "./app/models/championship_model"
require "./app/documents/championship_document"

class Championship < BaseRepository
  fields :owner_id, :name, :created_at, :updated_at

  belongs_to :owner, :class_name => User

  def self.add(user_id, name)
    Championship.where(:owner_id => user_id, :name => name).first_or_create
  end

  def betters
    [owner] # + betters
  end
end