require "active_repository"
require "./app/repositories/repository_support"
require "./app/repositories/championship"
require "./app/models/group_model"
require "./app/documents/group_document"

class Group < ActiveRepository::Base
  fields :championship_id, :name

  belongs_to :championship

  validates_uniqueness_of :name, :scope => :championship_id

  Group.set_model_class(eval("Group#{RepositorySupport.model_class_suffix}"))
  Group.set_save_in_memory(RepositorySupport.save_in_memory?)

  def self.add(championship_id, name)
    Group.find_or_create(:championship_id => championship_id, :name => name)
  end
end