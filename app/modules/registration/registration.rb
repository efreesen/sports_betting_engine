require "./app/repositories/user.rb"

class Registration
  def self.register(attributes)
    external_id = attributes[:external_id]
    
    user = User.find_by_external_id external_id

    if user.nil?
      user = User.create(attributes)
    else
      user = user.update_attributes(attributes)
    end

    user.reload
  end

  def self.update(external_id, key, value)
    user = User.find_by_external_id external_id

    user.update_attribute key.to_sym, value unless key == :external_id

    user.reload
  end
end