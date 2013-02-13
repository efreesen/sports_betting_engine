require "active_repository"
require "./app/repositories/user"

class Championship < ActiveRepository::Base
  fields :owner_id, :name

  belongs_to :owner, :class_name => User

  def self.add(user_id, name)
    Championship.find_or_create(:owner_id => user_id, :name => name)
  end
end