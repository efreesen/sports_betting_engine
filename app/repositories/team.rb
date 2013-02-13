require "active_repository"
require "./app/repositories/user"

class Team < ActiveRepository::Base
  fields :championship_id, :name, :flag_url

  belongs_to :owner, :class_name => User

  validates_uniqueness_of :name, :scope => :championship_id

  def self.add(championship_id, name, flag_url)
    team = Team.find_or_create(:championship_id => championship_id, :name => name)

    team.update_attribute(:flag_url, flag_url) unless team.flag_url == flag_url

    team
  end
end