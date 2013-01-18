require "active_repository"
require "./app/repositories/championship"

class Group < ActiveRepository::Base
  fields :championship_id, :name

  belongs_to :championship

  validates_uniqueness_of :name, :scope => :championship_id

  def self.add(championship_id, name)
    Group.find_or_create(:championship_id => championship_id, :name => name)
  end
end