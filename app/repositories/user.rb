require "active_repository"
require "./app/repositories/repository_support"
require "./app/repositories/bet"
require "./app/models/user_model"
require "./app/documents/user_document"
require "./app/mapper_documents/user_mapper_document"

class User < ActiveRepository::Base
  fields :name, :email, :external_id, :score, :created_at, :updated_at

  has_many :bets

  validates_uniqueness_of :external_id

  User.set_model_class(eval("User#{RepositorySupport.model_class_suffix}"))
  User.set_save_in_memory(RepositorySupport.save_in_memory?)
end