require "active_repository"
require "./app/repositories/base_repository"
require "./app/repositories/user"
require "./app/models/team_model"
require "./app/documents/team_document"

class Team < BaseRepository
  fields :championship_id, :name, :flag_url, :created_at, :updated_at

  belongs_to :owner, :class_name => User

  validates_uniqueness_of :name, :scope => :championship_id

  def self.add(championship_id, name, flag_url)
    team = Team.where(:championship_id => championship_id, :name => name).first_or_create

    team.update_attribute(:flag_url, flag_url) unless team.name == name

    team
  end
end