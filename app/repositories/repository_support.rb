class RepositorySupport
  def self.save_in_memory?
    true
    # false
  end

  def self.model_class_suffix
    "Model"
    # "Document"
  end
end