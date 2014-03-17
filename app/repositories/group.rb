require "active_repository"
require "./app/repositories/base_repository"
require "./app/repositories/championship"
require "./app/models/group_model"
require "./app/documents/group_document"

class Group < BaseRepository
  fields :championship_id, :name, :created_at, :updated_at

  belongs_to :championship

  validates_uniqueness_of :name, :scope => :championship_id

  def self.add(championship_id, name)
    Group.where(:championship_id => championship_id, :name => name).first_or_create
  end
end