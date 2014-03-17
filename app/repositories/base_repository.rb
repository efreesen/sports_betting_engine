require "active_repository"

class BaseRepository < ActiveRepository::Base
  self.save_in_memory = true
  self.postfix = "Model"
end