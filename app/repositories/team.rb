require "active_repository"
require "./app/repositories/repository_support"
require "./app/repositories/user"
require "./app/models/team_model"
require "./app/documents/team_document"

class Team < ActiveRepository::Base
  fields :championship_id, :name, :flag_url

  belongs_to :owner, :class_name => User

  validates_uniqueness_of :name, :scope => :championship_id

  Team.set_model_class(eval("Team#{RepositorySupport.model_class_suffix}"))
  Team.set_save_in_memory(RepositorySupport.save_in_memory?)

  def self.add(championship_id, name, flag_url)
    team = Team.find_or_create(:championship_id => championship_id, :name => name)

    team.update_attribute(:flag_url, flag_url) unless team.name == name

    team
  end
end