require "active_repository"
require "./app/repositories/user.rb"

class Group < ActiveRepository::Base
  set_model_class(self)

  fields :owner_id, :name

  belongs_to :owner, :class_name => User

  validates_uniqueness_of :owner_id

  def self.add(user_id, name)
    Group.find_or_create(:owner_id => user_id, :name => name)
  end
end