require "active_repository"
require "./app/repositories/repository_support"
require "./app/repositories/user"
require "./app/models/championship_model"
require "./app/documents/championship_document"

class Championship < ActiveRepository::Base
  fields :owner_id, :name

  belongs_to :owner, :class_name => User

  Championship.set_model_class(eval("Championship#{RepositorySupport.model_class_suffix}"))
  Championship.set_save_in_memory(RepositorySupport.save_in_memory?)

  def self.add(user_id, name)
    Championship.find_or_create(:owner_id => user_id, :name => name)
  end

  def betters
    [owner] # + betters
  end
end