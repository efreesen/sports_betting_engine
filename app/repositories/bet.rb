require "active_repository"
require "./app/repositories/repository_support"
require "./app/repositories/user"
require "./app/models/bet_model"
require "./app/documents/bet_document"
require "./app/mapper_documents/bet_mapper_document"

class Bet < ActiveRepository::Base
  fields :user_id, :match_id, :home_team_score, :away_team_score, :created_at, :updated_at

  belongs_to :user
  belongs_to :match

  validates_presence_of :home_team_score, :away_team_score

  Bet.set_model_class(eval("Bet#{RepositorySupport.model_class_suffix}"))
  Bet.set_save_in_memory(RepositorySupport.save_in_memory?)
end